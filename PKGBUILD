# Maintainer: Alexander Daum <alexander.daum@mailbox.org>

# Adapted from the official arch systemc repository, which is maintained by:
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Simon Doppler <dopsi[at]dopsi[dot]ch>
# Contributor: Kyle Brooks <brookskd[at]gmail[dot]com>
# Contributor: bl4ckb0x <navkamal90[at]gmail[dot]com>

# Some symbols in libsystemc.so contain the C++ standard used to compile systemc.
# If you want to use newer C++ features in programs linking to systemc, you can change the 
# variable cxxstandard.
# Systemc 3.0 requires at least C++17

pkgname=systemc3
_pkgname=systemc # name of the archive
pkgver=3.0.0
pkgrel=1
pkgdesc="Set of C++ classes and macros which provide an event-driven simulation interface for modeling and describing complex hardware systems"
url="http://www.accellera.org/downloads/standards/systemc"
arch=('x86_64')
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'ninja')
conflicts=('systemc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/accellera-official/systemc/archive/$pkgver.tar.gz")
sha512sums=('c88002ca788b39f7fb3ce4a2752f99db21fac25f66d53aee9f26e87ef000e4ed7ff3e805c0df575280c28f78c57d71223b4312f987acbf57723c37003b407adf')

cxxstandard=17

prepare() {
  mkdir -p build
  sed -i 's/set (CMAKE_BUILD_TYPE Release/set (CMAKE_BUILD_TYPE ""/' $_pkgname-$pkgver/CMakeLists.txt
}

build() {
  cd build
  cmake -GNinja -DCMAKE_CXX_STANDARD="$cxxstandard" -DCMAKE_INSTALL_PREFIX=/usr ../$_pkgname-$pkgver
  ninja
}

check() {
  cd build
  # patch build.ninja, ctest -C does not work with the ctest from repos
  sed -i 's/ctest -C/ctest -C ./g' build.ninja
  ninja check
}

package() {
  cd build
  DESTDIR="$pkgdir" ninja install
}
