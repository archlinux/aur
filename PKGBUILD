# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
_pkgname=libglibutil
pkgname=${_pkgname}-git
pkgver=1.0.75.r0.g4e11001
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('i686' 'x86_64')
depends=('glib2')
makedepends=('git' 'make')
url="https://github.com/sailfishos/libglibutil"
license=('BSD')
source=(${_pkgname}::git+${url}.git)
sha256sums=('SKIP')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  make KEEP_SYMBOLS=1 release pkgconfig
}

package() {
  cd "$srcdir/$_pkgname"

  msg2 "Packaging library..."
  make DESTDIR="$pkgdir" install
  msg2 "Packaging headers..."
  make DESTDIR="$pkgdir" install-dev

  msg2 "Fixing permissions..."
  cd "$pkgdir/usr/lib"
  chmod +x "$(readlink "libglibutil.so.1")"
}
