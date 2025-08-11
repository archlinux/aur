#!/bin/bash

# Maintainer: dreieck

# For upstream versions, see https://invisible-island.net/archives/add/

## This `PKGBUILD` also symlinks `tapecalc` to `add`, to make it available under the old executable name, too.

_pkgname=tapecalc
pkgname="${_pkgname}"
epoch=0
pkgver=t20240110
_downloadver="${pkgver##t}" # Strip off leading `t` to get version for download URL.
pkgrel=2

pkgdesc="Fixed-point calculator as a fullscreen editor. You may edit at any position in the expression list. Supports basic arithmetic, interest and sales tax computation. Designed for use as a checkbook or expense-account balancing tool. Formerly known as 'add'."
url="http://invisible-island.net/add/add.html"
license=('LicenseRef-OpenSource_with_conditions')

arch=(
  'i686'
  'x86_64'
  'arm'
  'arm64'
)

depends=(
  'glibc'
  'ncurses'
  'libncursesw.so'
)
makedepends=()
optdepends=()
provides=("add=${pkgver}")
replaces=("tapecalc-add-compat<=t20240110")
conflicts=("add")

options=('emptydirs' 'strip')

source=(
  # "add-latest.tar.gz::https://invisible-island.net/datafiles/release/add.tar.gz"
  "https://invisible-island.net/archives/add/add-${_downloadver}.tgz"
  "https://invisible-island.net/archives/add/add-${_downloadver}.tgz.asc"
)

validpgpkeys=('19882D92DDA4C400C22C0D56CC2AF4472167BE03')

sha256sums=(
  '038c814e6349f29595357e05e7059f730ba4513138d11f4bcd8f3dcb3a045e8b'
  '68bad3037e903210b54eacd611e044686c3595bfea65af94f64aec48ae725696'
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
  msg "Fixing executable name in 'xterm.sh' ..."
  sed -E "s|([[:space:]])add([[:space:]])|\1${_pkgname}\2|" -i "xterm.sh"

  # The way specifiyng a font size is a bit broken. Changing it ...
  msg "Changing the way to specify fontsize in 'xterm.sg' ..."
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


  cd "${pkgdir}/usr/bin"
  ln -sv tapecalc add
}
