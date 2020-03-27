# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=rocr-runtime-git
_pkgname=ROCR-Runtime
pkgver=latest
pkgrel=1
pkgdesc="ROCm Platform Runtime: ROCr a HPC market enhanced HSA based runtime"
url="https://github.com/RadeonOpenCompute/ROCR-Runtime"
arch=(x86_64)
license=('custom:NCSAOSL')
makedepends=('git' 'cmake' 'libelf' 'hsakmt-roct')
provides=('rocr-runtime')
conflicts=('rocr-runtime')
source=("git+https://github.com/RadeonOpenCompute/ROCR-Runtime.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$srcdir/build"
  cd "$srcdir/build"

  cmake -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DHSAKMT_INC_PATH=/opt/rocm/include \
        -DHSAKMT_LIB_PATH=/opt/rocm/lib \
        "$srcdir/$_pkgname/src"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/rocm-runtime.conf"
/opt/rocm/lib
/opt/rocm/hsa/lib
EOF
}
