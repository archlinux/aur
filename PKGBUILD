# Maintainer: Marko Semet <marko10_000@mailbox.org>
pkgname=buildbox-run-bubblewrap
pkgver=1.0.0
pkgrel=3
pkgdesc="An implementation of a runner for BuildGrid/buildbox using Bubblewrap."
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=(bubblewrap google-glog grpc util-linux-libs 'buildbox-common')
makedepends=(benchmark 'cmake' 'git' ninja)
source=("git+https://gitlab.com/BuildGrid/buildbox/buildbox-run-bubblewrap#tag=1.0.0&commit=9808341cd6d1fe3b9a71578276f8c7394070116f")
sha256sums=('SKIP')

build() {
  mkdir -p build
  cd build
  CXXFLAGS="-flto=auto -O2 -ffunction-sections -Wl,--gc-sections" cmake ../buildbox-run-bubblewrap \
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
