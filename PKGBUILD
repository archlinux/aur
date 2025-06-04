# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=ng-log
pkgver=0.8.0
pkgrel=1
pkgdesc="API compatible maintained fork of google-glog application-level logging library"
arch=(x86_64)
url='https://ng-log.github.io/ng-log'
license=(BSD-3-Clause)
depends=(
  gcc-libs
)
makedepends=(
  cmake
  git
)
provides=(google-glog)
conflicts=(google-glog)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ng-log/ng-log/archive/refs/tags/v${pkgver}.tar.gz"
"obsolete-glog-pc.patch::https://github.com/ng-log/ng-log/pull/8.patch")
sha256sums=('5686d086d3891e342906797e99c785f9a54fe670cfedddb005597ef2891a9f09'
            '1d67232253b5ea8d622073f470db0bb6777df0053686f08d044b4cb3259e7150')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i ../obsolete-glog-pc.patch
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_PKGCONFIG=ON \
    -DBUILD_SHARED_LIBS=ON \
    -Wno-dev
  cmake --build build
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
# vim:set ts=2 sw=2 et:
