# Maintainer:

# This package syncs with core/glibc on rebuild.

## options
: ${_build_roco=true}

# delete old package
_file="glibc-main.tar.gz"
if [ -e "$_file" ]; then
  find . -maxdepth 0 -mtime +1 -type f -name "$_file" -delete
fi

# sync with core/glibc
if [ ! -e "$_file" ]; then
  curl --no-clobber -o "$_file" "https://gitlab.archlinux.org/archlinux/packaging/packages/glibc/-/archive/main/glibc-main.tar.gz"

  # unpack files
  rm -rf arch-glibc
  mkdir -p arch-glibc
  bsdtar -C arch-glibc --strip-components 1 -xf "$_file"

  # copy files
  _glibc_files=(
    $(grep -E '(source|install) = ' arch-glibc/.SRCINFO | grep -v http | sed 's&^.* = &&')
  )

  for i in ${_glibc_files[@]}; do
    rm -f "$i"
    cp arch-glibc/"$i" "$i"
  done
fi

# package
source "arch-glibc/PKGBUILD"

if [ "${_build_roco::1}" == "t" ]; then
  source "PKGBUILD.roco.append"
else
  source "PKGBUILD.eac.append"
fi
