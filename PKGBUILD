# Maintainer: Shinmen <shinmen@example.com>
# Contributor: Mikhail Rudenko <mike.rudenko@gmail.com>

pkgname=highfive
pkgver=3.3.0
pkgrel=1
pkgdesc="Header-only C++ HDF5 interface"
arch=('any')
url='https://github.com/highfive-devs/HighFive'
license=('Boost')
depends=('boost' 'hdf5' 'eigen')
makedepends=('cmake' 'catch2')
source=(https://github.com/highfive-devs/$pkgname/archive/v$pkgver.tar.gz
        fix-tests-arch.patch)
md5sums=('feffc572dfa3de094cd04ddf25e57e16'
         'ca2b938810355b841114a3b765ff7953')

prepare() {
  mkdir -p build-$pkgver
  cd $pkgname-$pkgver

  patch -p1 < "$srcdir/fix-tests-arch.patch"
}

build() {
  cd build-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DHIGHFIVE_EXAMPLES=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        ../$pkgname-$pkgver
  make
}

check() {
  cd build-$pkgver
  make test
}

package() {
  cd build-$pkgver
  make DESTDIR="$pkgdir/" install
}
