# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Jakub Okoński <jakub@okonski.org>
pkgname=rocr-runtime
_pkgname=ROCR-Runtime-roc
pkgver=3.0.0
pkgrel=1
pkgdesc="ROCm Platform Runtime: ROCr a HPC market enhanced HSA based runtime"
arch=('x86_64')
url="https://github.com/RadeonOpenCompute/ROCR-Runtime"
license=('custom:NCSAOSL')
makedepends=('cmake' 'libelf' 'roct-thunk-interface')
source=("https://github.com/RadeonOpenCompute/ROCR-Runtime/archive/roc-$pkgver.tar.gz")
sha256sums=("6d133e285535adef61464f7f0377fe97c480323ebfd242b34b5585b8bb41f99e")

build() {
  mkdir -p "$srcdir/$_pkgname-$pkgver/src/build"
  cd "$srcdir/$_pkgname-$pkgver/src/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DHSAKMT_INC_PATH=/opt/rocm/include \
        -DHSAKMT_LIB_PATH=/opt/rocm/lib \
        ..
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver/src/build"

  make DESDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocm-runtime.conf"
/opt/rocm/lib
/opt/rocm/hsa/lib
EOF
}
