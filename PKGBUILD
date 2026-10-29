# Maintainer: Qirui Wang <wqr.prg@gmail.com>

_name=rumur
pkgname="$_name-git"
pkgver=2026.09.13.r45.g7182ac14
pkgrel=1
pkgdesc="Yet another Murphi model checker"
arch=('x86_64')
# GCC 16.2.1 ICEs in ipa.cc:remove_unreachable_nodes when -O3 is combined
# with LTO. Arch's default -O2 -flto is fine. Uncomment if building with -O3.
#options=('!lto')
url="https://github.com/Smattr/rumur"
license=('custom:UNLICENSE')
depends=('gmp' 'python')
makedepends=('git' 'cmake' 'bison>=3.3.2' 'flex')
checkdepends=('python-pytest' 'valgrind' 'z3')
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
  rm -rf build/CMakeCache.txt
  mkdir -p build
}

build() {
  cd build
  cmake "../$_name" \
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
  install -Dm644 "../$_name/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/licence"
}
