# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=blaspp
pkgver=2025.05.28
pkgrel=1
pkgdesc="C++ API for the Basic Linear Algebra Subroutines"
arch=('x86_64')
url="https://github.com/icl-utk-edu/$pkgname"
license=('BSD-3-Clause')
depends=('glibc'
         'libgcc'
         'libgomp'
         'libstdc++'
         'blas'
         'lapack')
makedepends=('cmake'
             'cblas'
             'testsweeper')
checkdepends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'lapack-libraries.patch')
sha256sums=('8a4254e672e7f422eb62f70861f70bfa9582b622ef9e448bec3b6639b8077f8c'
            '9df53f25019dfb876125b2115ce6580f604b551ecef26a818e04ad4befccd4fa')

prepare() {
  cd "$pkgname-$pkgver"
  # Keep the LAPACK library found by LAPACKFinder in blaspp_libraries (backport of upstream commit 6e87808)
  patch -Np1 -i ../lapack-libraries.patch
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -Dbuild_tests=ON -Dcolor=ON -Duse_openmp=ON -Dgpu_backend=none -Dblas=generic -Dblas_int=int -Dlapack=generic -Wno-dev
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  DESTDIR="$PWD"/build/install cmake --install build
  cmake -S examples -B build-examples -DCMAKE_PREFIX_PATH="$PWD"/build/install/usr -Wno-dev
  cmake --build build-examples
  LD_LIBRARY_PATH="$PWD"/build/install/usr/lib ctest --test-dir build-examples --output-on-failure
  cd build/test
  python run_tests.py --quick --blas1 --blas2 --blas3
  python run_tests.py --quick --batch-blas3
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
