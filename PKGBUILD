#Maintainer: Mikhail Rudenko <mike.rudenko@gmail.com>

pkgname=highfive
_pkgname=HighFive
pkgver=2.9.0
pkgrel=1
pkgdesc="Header-only C++ HDF5 interface"
arch=('any')
url='https://github.com/BlueBrain/HighFive'
license=('Boost')
depends=('boost' 'hdf5' 'eigen')
makedepends=('cmake')
source=(https://github.com/BlueBrain/$_pkgname/archive/v$pkgver.tar.gz)
md5sums=('2d63bbc518362e5b928f19f122504f05')

prepare() {
  mkdir -p build-$pkgver
  cd $_pkgname-$pkgver
}

build() {
  cd build-$pkgver
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DHIGHFIVE_EXAMPLES=OFF \
        -DHIGHFIVE_USE_EIGEN=ON -DCMAKE_BUILD_TYPE=Release \
        -DHIGHFIVE_UNIT_TESTS=OFF \
        ../$_pkgname-$pkgver
  make
}

# Skip check() for now due to conflicting Catch2 versions. HighFive
# 2.7.0 requires Catch2 v3 for unit tests, but the main Arch repos
# provide Catch2 v2.

# check() {
#   cd build-$pkgver
#   make test
# }

package() {
  cd build-$pkgver
  make DESTDIR="$pkgdir/" install
}
