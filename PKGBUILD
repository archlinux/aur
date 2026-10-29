# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2026.09.13
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
# GCC 16.2.1 ICEs in ipa.cc:remove_unreachable_nodes when -O3 is combined
# with LTO. Arch's default -O2 -flto is fine. Uncomment if building with -O3.
#options=('!lto')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp' 'python')
makedepends=('cmake' 'bison>=3.3.2' 'flex')
checkdepends=('python-pytest' 'valgrind' 'z3')
optdepends=('z3: Preferred SMT solver'
            'cvc4: Alternative SMT solver')
source=("https://github.com/Smattr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('f5cd322cae6af1473ce31ece08ff15e028f37f25da15973d88b87a3c77b995cd')

prepare() {
  rm -rf build/CMakeCache.txt
  mkdir -p build
}

build() {
  cd build
  cmake "../$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make
}

check() {
  cd build
  # The test needs about 1 hour
  #make check
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "../$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
