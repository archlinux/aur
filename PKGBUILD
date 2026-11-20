# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=lapackpp
pkgname=lapackpp-sycl
pkgver=2025.05.28
pkgrel=1
pkgdesc="C++ API for the Linear Algebra PACKage (with SYCL and oneMKL)"
arch=('x86_64')
url="https://github.com/icl-utk-edu/$_name"
license=('BSD-3-Clause')
depends=('glibc'
         'libgcc'
         'libstdc++'
         'blaspp-sycl'
         'intel-oneapi-compiler-shared-runtime-libs'
         'intel-oneapi-compiler-dpcpp-cpp-runtime-libs'
         'intel-oneapi-openmp'
         'intel-oneapi-mkl'
         'intel-oneapi-mkl-sycl')
makedepends=('cmake'
             'intel-oneapi-dpcpp-cpp'
             'procps-ng')
provides=("lapackpp=$pkgver")
conflicts=('lapackpp')
options=('!lto')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'ifail-copy.patch')
sha256sums=('a29be08104f52ca835e300a6aa0530831d67c52a57f72e7b4fb36b3f6859ab7c'
            '251b67e18d216e5e10b31a9cd0adc182b60d54bbe05f3a1465d39e21d95d54ac')

prepare() {
  cd "$_name-$pkgver"
  # Copy ifail without indexing past its end (_GLIBCXX_ASSERTIONS aborts heevx, hegvx and the other ?evx/?gvx wrappers when all eigenvalues are found)
  patch -Np1 -i ../ifail-copy.patch
}

build() {
  cd "$_name-$pkgver"
  source /opt/intel/oneapi/setvars.sh
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -Dbuild_tests=OFF -Dcolor=ON -DCMAKE_CXX_COMPILER=icpx -Dgpu_backend=sycl -Wno-dev
  cmake --build build
}

package() {
  cd "$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
