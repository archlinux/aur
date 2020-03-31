# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>

pkgname=hsa-rocr-git
pkgver=r96.3eed1b4
pkgrel=1
pkgdesc="ROCm Platform Runtime: ROCr a HPC market enhanced HSA based runtime"
url="https://github.com/RadeonOpenCompute/ROCR-Runtime"
arch=(x86_64)
license=('custom:NCSAOSL')
makedepends=('git' 'cmake' 'libelf' 'hsakmt-roct')
provides=('hsa-rocr')
replaces=('rocr-runtime-git')
conflicts=('hsa-rocr')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm \
        -DHSAKMT_INC_PATH=/opt/rocm/include \
        -DHSAKMT_LIB_PATH=/opt/rocm/lib \
        "$pkgname/src"
  make
}

package() {
  make DESTDIR="$pkgdir" install

  install -Dm644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/${pkgname%-git}.conf" <<-EOF
    /opt/rocm/lib
    /opt/rocm/hsa/lib
EOF
}
