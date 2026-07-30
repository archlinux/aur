# Maintainer: Austin Choi <austin.c.percussion@gmail.com>
pkgname=geas
pkgver=0.7.3
pkgrel=1
pkgdesc="Contract oriented interop language: contracts compile to in process C ABI modules and a gRPC bridge"
arch=('x86_64')
url="https://github.com/choice404/geas"
license=('MIT')
# geas shells out to cc to compile the C it emits, so a C compiler is a
# runtime dependency, not just a build one. The runtime's SQLite is vendored
# and compiled in, so the store adds nothing here.
depends=('gcc')
# The compiler is written in dusk; dusk-lang-git provides dusk-lang.
makedepends=('dusk-lang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7e9248ea5fe1705799240463828b914147849f2e834303fa42418d620dfdde5f')

build() {
  cd "$pkgname-$pkgver"
  make compiler runtime
}

check() {
  cd "$pkgname-$pkgver"
  make test-lang test-std
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 spec.md "$pkgdir/usr/share/doc/$pkgname/spec.md"
}
