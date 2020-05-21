# Maintainer: Markus Näther <naether.markus@gmail.com>
pkgname=hipblas
pkgver=3.3.0
pkgrel=2
pkgdesc='ROCm BLAS marshalling library'
arch=('x86_64')
url='https://rocmdocs.amd.com/en/latest/ROCm_Libraries/ROCm_Libraries.html#hipblas'
license=('MIT')
depends=('rocblas' 'hip-hcc')
makedepends=('cmake' 'hcc')
_git='https://github.com/ROCmSoftwarePlatform/hipBLAS'
source=("$pkgname-$pkgver.tar.gz::$_git/archive/rocm-$pkgver.tar.gz"
        'hipblas_hsa.patch')
sha256sums=('7be4f69749fb0b8deeaf47615f2c1ffbeee15f9cd6ef14cfea2a550cb0347a50'
            'd5206ce084f065f860ba1b1f9dc860c1500d9d4cc0b92473e1072ad819e8148d')

prepare() {
  cd "$srcdir/hipBLAS-rocm-$pkgver"
  patch -Np1 -i "$srcdir/hipblas_hsa.patch"
}

build() {
  mkdir -p build
  cd build

  CXX=/opt/rocm/hcc/bin/hcc \
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm/hipblas \
        -Damd_comgr_DIR=/opt/rocm/lib/cmake/amd_comgr \
        -DBUILD_CLIENTS_SAMPLES=OFF \
        -DBUILD_CLIENTS_TESTS=OFF \
        "$srcdir/hipBLAS-rocm-$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="$pkgdir" install

  install -Dm644 /dev/stdin "$pkgdir/etc/ld.so.conf.d/hipblas.conf" <<EOF
/opt/rocm/hipblas/lib
EOF
  install -Dm644 "$srcdir/hipBLAS-rocm-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
