# Maintainer: Davide Depau <davide@depau.eu>
_pkgname=libglibutil
pkgname=${_pkgname}-git
pkgver=1.0.35.r0.g80575f4
pkgrel=1
pkgdesc="Library of glib utilities"
arch=('i686' 'x86_64')
depends=('glib2')
makedepends=('git' 'make')
url="https://git.sailfishos.org/mer-core/libglibutil"
license=('BSD')
source=(${_pkgname}::git+https://git.merproject.org/mer-core/libglibutil.git)
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
