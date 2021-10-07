# Maintainer: Qirui Wang <wqr.prg@gmail.com>

pkgname=rumur
pkgver=2021.09.29
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
sha256sums=('e61eb820375168955da24dd29e03033991695606263fe040566d20158c3c8cde')

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
  #env PATH="${PWD}/rumur:${PWD}/murphi2c:${PWD}/murphi2murphi:${PWD}/murphi2uclid:${PWD}/murphi2xml:${PWD}/tests/murphi-comment-ls${PATH:+:$PATH}" "../$pkgname-$pkgver/tests/run-tests.py"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "../$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
