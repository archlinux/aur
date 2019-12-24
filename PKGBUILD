# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=rumur
pkgname="$_name-git"
pkgver=2019.12.22.r0.ga1b6d61
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp' 'python')
makedepends=('git' 'cmake' 'bison>=3.3.2' 'flex')
checkdepends=('valgrind' 'z3')
optdepends=('z3: Preferred SMT solver'
            'cvc4: Alternative SMT solver')
provides=("$_name")
conflicts=("$_name")
source=("git+https://github.com/Smattr/$_name.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_name"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake "../$_name" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

check() {
  cd build
  # The test needs about 1 hour
  #env PATH="./rumur:./ast-dump${PATH:+:$PATH}" "../$pkgname-$pkgver/tests/run-tests.py"
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 "../$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
