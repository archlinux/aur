# Contributor: ledti <antegist at gmail.com>
# Contributor: Stefan Husmann <Stefan-Husmann@t-online.de>
_base=evilvte
pkgname=${_base}-git
pkgver=150.8dfa41e
pkgrel=6
pkgdesc="VTE based, highly customizable terminal emulator"
arch=(any)
url="http://www.calno.com/${_base}"
license=(GPL2)
depends=(hicolor-icon-theme vte-legacy)
makedepends=(git pkg-config)
provides=(${_base})
conflicts=(${_base})
source=(git+https://github.com/caleb-/${_base}.git)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  # copy config.h to startdir to ease configuration:
  cd "$startdir"
  if [[ -e config.h ]]; then
    cp -f config.h "$srcdir/${_base}/src/"
    echo "To reset your configuration, remove $startdir/config.h"
  else
    cp "$srcdir/${_base}/src/config.h" config.h
    echo "Edit $startdir/config.h and recompile to change your settings."
  fi
}

build() {
  LANG=C
  cd ${_base}
  ./configure --prefix=/usr --with-gtk=2.0
  make
}

package() {
  cd ${_base}
  make DESTDIR="$pkgdir" install
}
