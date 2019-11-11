# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=rumur
pkgname="$_name-git"
pkgver=2019.11.09.r4.gc04d79d
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
  mkdir -p $_name/build
}

build() {
  cd $_name/build
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib
  make
}

check() {
  cd $_name/build
  # The test needs about 1 hour
  #../tests/integration-tests.py --verbose
}

package() {
  cd $_name/build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/licence"
}
