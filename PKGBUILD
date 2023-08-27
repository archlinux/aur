# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-casd
pkgver=1.0.0
pkgrel=2
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(google-glog grpc util-linux-libs)
makedepends=(benchmark 'buildbox-common' 'buildbox-fuse' 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-casd#tag=1.0.0&commit=824ee5f12417427543478ea77f9e8f9759c94b32")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  CXXFLAGS="-flto=auto -O2 -ffunction-sections -Wl,--gc-sections" cmake ../buildbox-casd \
    -G Ninja \
    -DCMAKE_CXX_FLAGS=-Wno-error=restrict \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  echo "Test 'cas_proxy_tests' and 'local_cas_service_tests' can take some time."
  ninja test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
}
