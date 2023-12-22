print_help() {
  echo "usage: script [options] -d required -ie required -oe required"
  echo "  -d   directory of the files to be converted"
  echo "  -ie  input media files extension"
  echo "  -oe  output media files extension"
  echo "  -h   print this help prompt"
  echo ""
  echo "copyrighted to Abdelrahman Mohamed (elreload.dev@gmail.com)"
  echo "MIT license"
}

if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
  print_help
  exit
elif [ "$1" != "-d" ]; then
  echo "work directory must be provided using -d"
  echo ""
  print_help
  exit
fi

if [ "$3" != "-ie" ]; then
  echo "input files extension must be provided using -ie"
  echo ""
  print_help
  exit
fi

if [ "$5" != "-oe" ]; then
  echo "output files extension must be provided using -oe"
  echo ""
  print_help
  exit
fi

FILES="$2/*.$4"
i=0

if [ ! -d "$2/converted" ]; then
  mkdir "$2/converted"
fi

for file in $FILES; do
  name=$(echo "$file" | cut -d'.' -f2 | cut -d'/' -f2)
  ifile="$name.$4"
  ofile="$name.$6"

  echo "Converting \"$ifile\" to \"$ofile\" ..."
  # echo "ffmpeg -i \"./$ifile\" \"$2/converted/$ofile\""

  ffmpeg -i "./$ifile" "./converted/$ofile"
  i=$((i + 1))
done

echo "Finished converting $i files from \"$4\" to \"$6\"!"
