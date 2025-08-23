# Maintainer:

: ${_build_man_extra=false}

export -n BROWSER EDITOR VISUAL PAGER TERMINAL_EMULATOR

_pkgname="sensible-utils"
pkgname="$_pkgname-git"
pkgver=0.0.26.r0.gfa5c653
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
url="https://salsa.debian.org/debian/sensible-utils"
license=('GPL-2.0-or-later')
arch=('any')

depends=(
  'bash'
)
makedepends=(
  'git'
  'po4a'
)
checkdepends=(
  'ed'
  'shellcheck'
)

provides=("$_pkgname=${pkgver%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --match='debian/*' --exclude='debian/*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$_pkgsrc"
  make -k check || true
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir/" install

  if [ "${_build_man_extra::1}" != "t" ]; then
    rm -rf "$pkgdir/usr/share/man"/[a-z][a-z]/
  fi
}
