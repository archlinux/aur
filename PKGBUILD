# Maintainer:
# Contributor: Fredrick R. Brennan <copypaste@kittens.ph>
# Contributor: éclairevoyant
# Contributor: Brian BIdulock <bidulock@openss7.org>

: ${_build_man_extra=false}

_pkgname="sensible-utils"
pkgname="$_pkgname"
pkgver=0.0.24
pkgrel=1
pkgdesc="Utilities for sensible alternative selection"
url="https://salsa.debian.org/debian/sensible-utils"
license=('GPL-2.0-or-later')
arch=('any')

depends=('bash')
makedepends=('po4a')
checkdepends=('ed')

provides=(
  "sensible-browser=$pkgver"
  "sensible-editor=$pkgver"
)
conflicts=(
  'sensible-browser'
  'sensible-browser-git'
  'sensible-editor'
  'sensible-editor-git'
  'sensible-pager'
  'sensible-pager-git'
  'sensible-terminal'
  'sensible-terminal-git'
  'sensible-utils-data'
  'sensible-utils-data-git'
  'sensible-utils-git'
)

_pkgsrc="$_pkgname-debian-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/-/archive/debian/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('2acbc0029a4b02e8447ab0c07557e0c296c21cf338e044efe37a3bd16a18e418')

_env_main() {
  export -n BROWSER EDITOR VISUAL PAGER TERMINAL_EMULATOR
}

build() {
  _env_main

  cd "$_pkgsrc"
  ./configure --prefix=/usr
  make
}

check() {
  _env_main

  cd "$_pkgsrc"
  make -k check || true
}

package() {
  _env_main

  cd "$_pkgsrc"
  make DESTDIR="$pkgdir/" install

  if [ "${_build_man_extra::1}" != "t" ]; then
    rm -rf "$pkgdir/usr/share/man"/[a-z][a-z]/
  fi
}
