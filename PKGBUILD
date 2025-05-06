# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.6.0
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'oniguruma')
makedepends=('rust' 'make' 'pkgconf' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
sha512sums=('e1fc49968d26d104f2bd9027b7ed95953bb5c68fdb290ab95888823030726e86f8f1928f4cb6666b8cd11d93e0d6ff9d66a34239da469675426b12700a740e30')
# build process with syntect (or inkjet) crate is a little... sensitive
options=('!buildflags')

build() {
  cd "dmos-$pkgver"

  export RUSTONIG_SYSTEM_LIBONIG=1
  cargo build --release --locked -p dmos-cli
  make -C man man
}

package() {
  cd "dmos-$pkgver"

  install -Dm755 "target/release/dmos" "$pkgdir/usr/bin/dmos"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "man/dmos.1.gz" "$pkgdir/usr/share/man/man1/dmos.1.gz"
}
