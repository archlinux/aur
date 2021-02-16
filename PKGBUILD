# Maintainer: skwerlman <skw@tetrarch.co>
# Contributor: Ethan Rakoff <ethan@ethanrakoff.com>
# Contributor: Scott Linder <scott.linder18@gmail.com>
# Contributor: Jorge Araya Navarro <elcorreo@deshackra.com>
# Contributor: Mikhail Burakov <mikhail.burakov@gmail.com>

pkgname=cockatrice-server-git
pkgver=2.8.1.beta.r3.gdb5f6e01
pkgrel=1
pkgdesc='Open-source multiplatform supported program for playing tabletop card games over a network.'
arch=('i686' 'x86_64')
url='https://cockatrice.github.io/'
license=('GPL2')
depends=('protobuf' 'qt5-websockets')
optdepends=('mariadb: database support')
makedepends=('cmake' 'git' 'mariadb-libs')
provides=('cockatrice-server')
conflicts=('cockatrice-server')
source=("$pkgname"::"git+https://github.com/Cockatrice/Cockatrice")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | cut -d- -f5- | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  test -d build && rm -rf build
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DWITH_ORACLE=0 -DWITH_CLIENT=0 -DWITH_DBCONVERTER=0 -DWITH_SERVER=1 -DTEST=0 ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}
