# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname=lapackpp
pkgver=2025.05.28
pkgrel=1
pkgdesc="C++ API for the Linear Algebra PACKage"
arch=('x86_64')
url="https://github.com/icl-utk-edu/$pkgname"
license=('BSD-3-Clause')
depends=('glibc'
         'libgcc'
         'libstdc++'
         'blaspp'
         'lapack')
makedepends=('cmake'
             'cblas'
             'lapacke'
             'testsweeper')
checkdepends=('python')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'ifail-copy.patch'
        'test-bounds.patch')
sha256sums=('a29be08104f52ca835e300a6aa0530831d67c52a57f72e7b4fb36b3f6859ab7c'
            '251b67e18d216e5e10b31a9cd0adc182b60d54bbe05f3a1465d39e21d95d54ac'
            '5553191404ae21df5c16af5a7e62fdf31caf88a55acdff0313f5d7a5cbe02f7d')

prepare() {
  cd "$pkgname-$pkgver"
  # Copy ifail without indexing past its end (_GLIBCXX_ASSERTIONS aborts heevx, hegvx and the other ?evx/?gvx wrappers when all eigenvalues are found)
  patch -Np1 -i ../ifail-copy.patch
  # Don't index past the end of vectors in the larft, tplqt and tplqt2 tests
  patch -Np1 -i ../test-bounds.patch
}

build() {
  cd "$pkgname-$pkgver"
  cmake -S . -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=None -DBUILD_SHARED_LIBS=ON -Dbuild_tests=ON -Dcolor=ON -Dgpu_backend=none -Dlapack=generic -Wno-dev
  cmake --build build
}

check() {
  cd "$pkgname-$pkgver"
  DESTDIR="$PWD"/build/install cmake --install build
  cmake -S examples -B build-examples -DCMAKE_PREFIX_PATH="$PWD"/build/install/usr -Wno-dev
  cmake --build build-examples
  LD_LIBRARY_PATH="$PWD"/build/install/usr/lib ctest --test-dir build-examples --output-on-failure
  cd build/test
  python run_tests.py --quick --host
}

package() {
  cd "$pkgname-$pkgver"
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
