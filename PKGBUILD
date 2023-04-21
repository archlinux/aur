# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-casd
pkgver=0.0.63
pkgrel=3
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(google-glog grpc util-linux-libs)
makedepends=(benchmark 'buildbox-common' 'buildbox-fuse' 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-casd#tag=0.0.63&commit=121b55b4fd996a714900e6b94310394b3bccdb26")
sha256sums=('SKIP')

build() {
  sed -i 's@CMAKE_CXX_STANDARD 14@CMAKE_CXX_STANDARD 20@' buildbox-casd/CMakeLists.txt
  mkdir -p build
  cd build
  cmake ../buildbox-casd \
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
