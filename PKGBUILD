# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
# Contributor: acxz <akashpatel2008 at yahoo dot com>
pkgname=atmi
pkgver=5.5.1
pkgrel=1
pkgdesc='Task graph framework for heterogeneous CPU-GPU systems.'
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/atmi"
license=('MIT')
depends=('hsa-rocr' 'comgr')
makedepends=('cmake' 'rsync')
source=("$pkgname-$pkgver.tar.gz::$url/archive/rocm-$pkgver.tar.gz")
sha256sums=('6b3ee68433506315b55d093a4b47463916874fb6f3f602098eaff2ec283e69ab')
_dirname="$(basename "$url")-$(basename "${source[0]}" .tar.gz)"

build() {
  cmake \
    -Wno-dev \
    -B build \
    -S "$_dirname/src" \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm \
    -DCMAKE_BUILD_TYPE=None \
    -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
    -DROCM_VERSION="$pkgver"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$_dirname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
