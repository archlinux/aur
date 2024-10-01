# Maintainer:

# This package syncs with core/glibc on rebuild.

pkgver=2.40+r16+gaa533d58ff
pkgrel=2

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

# fixups
sed -E -e 's&^(pkgver=.*)$&_\1&' \
  -e 's&^(pkgrel=.*)$&_\1&' \
  -e 's&abbrev=[0-9]+&abbrev=10&' \
  -i "arch-glibc/PKGBUILD"

# package
source "arch-glibc/PKGBUILD"

if [ "${_build_roco::1}" == "t" ]; then
  source "$startdir/PKGBUILD.roco.append"
else
  source "$startdir/PKGBUILD.eac.append"
fi

source+=(
  'PKGBUILD.eac.append'
  'PKGBUILD.roco.append'
)
b2sums+=(
  'SKIP'
  'SKIP'
)
