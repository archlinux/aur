# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-common
pkgver=1.0.7
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('gflags' 'google-glog' 'grpc' 'gtest')
makedepends=('benchmark' 'c-ares' 'cmake' 'git' 'gmock'  ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-common#tag=${pkgver}&commit=b1dc0fcf59ae0cb131f632484d3cd6dbc87fdeed")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  sed -i 's/STATIC/SHARED/' ../buildbox-common/CMakeLists.txt
  CXXFLAGS="-flto=auto -flto-partition=one -fuse-linker-plugin -fno-fat-lto-objects -O2 -ffunction-sections -Wl,--gc-sections ${CXXFLAGS}" cmake ../buildbox-common \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  echo "Sometimes 'executionstatsutils_tests' and 'streamingstandardoutputinotifyfilemonitor' fails, just rerun it."
  CTEST_OUTPUT_ON_FAILURE=True ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
