#!/bin/bash

# Maintainer: dreieck

_pkgname=tapecalc
pkgname="${_pkgname}"
epoch=0
pkgver=t20180401
pkgrel=3

pkgdesc="Fixed-point calculator as a fullscreen editor. You may edit at any position in the expression list. Supports basic arithmetic, interest and sales tax computation. Designed for use as a checkbook or expense-account balancing tool. Formerly known as 'add'."
url="http://invisible-island.net/add/add.html"
license=('custom: free software')

arch=(
  'i686'
  'x86_64'
  'arm'
  'arm64'
)

depends=(
  'ncurses'
  'libncursesw.so'
)
makedepends=()
optdepends=()
provides=()
replaces=()
conflicts=()

options=('emptydirs' 'strip')

source=(
  # "ftp://ftp.invisible-island.net/add/add.tar.gz"
  "ftp://ftp.invisible-island.net/add/add-20180401.tgz"
)

sha256sums=(
  '05996d853cfe7fdebfc3aac4458b3980f5548515599a745d6033743ee2cd3314'
)

# Since the downloaded file extracts to directories having the version in the name, we want to get the latest one, in case we have old source lying around.
_latestdir() {
  # Arguments: $1 (optional): Base directory where to search.
  local _dir
  if [ $# -ge 1 ]; then
    _dir="$1/"
  else
    _dir=''
  fi
  find "${_dir}"add-* -maxdepth 0 -mindepth 0 -type d | sort --version-sort -r | head -n 1
}

prepare() {
  cd "$(_latestdir "${srcdir}")"
  
  # The make system's renaming does not change the executable name in 'x+', so we do it by hand here:
  msg "Fixing executable name in 'x+' ..."
  sed -E "s|([[:space:]])add([[:space:]])|\1${_pkgname}\2|" -i "xterm.sh"
  
  # The way specifiyng a font size is a bit broken. Changing it ...
  msg "Changing the way to specify fontsize in 'x+' ..."
  sed -E "s|([[:space:]])\-fn[[:space:]]+[0-9]+x[0-9]+([[:space:]])|\1-xrm 'xterm*font:*-fixed-*-*-*-20-*'\2|" -i "xterm.sh"
}

pkgver() {
  # # We can extract the version information from the extracted directory name, which is simpler:
  # echo "t$(basename "$(_latestdir "${srcdir}")" | sed 's|^[^\-]*-||')"
  
  # Or we can extract it from the makefile.in, which is consistent with what would end up in the executable:
  cd "$(_latestdir "${srcdir}")"
  grep -E '^[[:space:]]*RELEASE[[:space:]]*=.*[0-9]+' makefile.in | cut -d= -f2 | tr -d '[[:space:]]' # | sed -E 's|^t||'
}


build() {
  cd "$(_latestdir "${srcdir}")"
  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --sharedstatedir=/var/lib \
    --includedir=/usr/include \
    --oldincludedir=/usr/include \
    --program-transform-name 's|add|tapecalc|' \
    --with-ncurses \
    --with-ncursesw \
    --without-pdcurses \
    --without-x \
    --without-Xaw3d \
    --without-Xaw3dxft \
    --without-neXtaw \
    --without-XawPlus
  make
}

package() {
  cd "$(_latestdir "${srcdir}")"
  
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share"/*.hlp
  
  for _docfile in CHANGES README; do
    install -v -D -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  
  install -v -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
