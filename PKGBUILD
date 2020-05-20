# Maintainer: Markus Näther <naetherm@informatik.uni-freiburg.de>
pkgname=hipsparse
pkgver=3.3.0
pkgrel=4
pkgdesc='rocSPARSE marshalling library.'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#hipsparse'
license=('MIT')
depends=('rocsparse' 'hip-hcc')
makedepends=('cmake' 'hcc' 'git')
_git='https://github.com/ROCmSoftwarePlatform/hipSPARSE'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz")
sha256sums=('c69336071f56c857e969f0fdfbc351f75cc44ed2e3b854b4688675a9cafe4e22')

build() {
  mkdir -p build
  cd build

  CXX=/opt/rocm/hcc/bin/hcc \
  cmake -DCMAKE_INSTALL_PREFIX=opt/rocm/hipsparse \
        -DCMAKE_CXX_FLAGS='-isystem /opt/rocm/hsa/include' \
        -Dhcc_DIR=/opt/rocm/hcc/lib/cmake/hcc \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -Dhip_DIR=/opt/rocm/hip/lib/cmake/hip \
        -Drocsparse_DIR=/opt/rocm/rocsparse/lib/cmake/rocsparse \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        -DBUILD_CLIENTS_TESTS=OFF \
        "$srcdir/hipSPARSE-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make install

  cp -a "$srcdir/build/opt" "$pkgdir"

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hipsparse.conf" << EOF 
/opt/rocm/hipsparse/lib
EOF
  install -Dm644 "$srcdir/hipSPARSE-rocm-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
