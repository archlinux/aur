# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2020.07.28
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp' 'python')
makedepends=('cmake' 'bison>=3.3.2' 'flex')
checkdepends=('valgrind' 'z3')
optdepends=('z3: Preferred SMT solver'
            'cvc4: Alternative SMT solver')
source=("https://github.com/Smattr/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('fae13956a395fb11c08af83ef345258177855e8bec5452c45b90e6bfaae55df6')

prepare() {
  rm -rf build/CMakeCache.txt
  mkdir -p build
}

build() {
  cd build
  cmake "../$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

check() {
  cd build
  # The test needs about 1 hour
  #env PATH="${PWD}/murphi2c:${PWD}/murphi2murphi:${PWD}/murphi2xml:${PWD}/rumur${PATH:+:$PATH}" "../$pkgname-$pkgver/tests/run-tests.py"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "../$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
