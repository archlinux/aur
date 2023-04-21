# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-run-bubblewrap
pkgver=0.0.64
pkgrel=2
pkgdesc="An implementation of a runner for BuildGrid/buildbox using Bubblewrap."
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(bubblewrap google-glog grpc util-linux-libs)
makedepends=(benchmark 'buildbox-common' 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-run-bubblewrap#tag=0.0.64&commit=0f9a932d92305d2bc8d15a962b7caf707286f97a")
sha256sums=('SKIP')

build() {
  sed -i 's/CMAKE_CXX_STANDARD 14/CMAKE_CXX_STANDARD 20/' buildbox-run-bubblewrap/CMakeLists.txt
  mkdir -p build
  cd build
  cmake ../buildbox-run-bubblewrap \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

check() {
  cd build
  ninja -k-1 test
}

package() {
  cd build
  DESTDIR="$pkgdir/" ninja install
  ln -s buildbox-run-bubblewrap "$pkgdir/usr/bin/buildbox-run"
}
