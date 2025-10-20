# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.6.2
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'oniguruma')
makedepends=('rust' 'make' 'pkgconf' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
sha512sums=('fde23c8448759a5a5c09aedbb41c249ca988590c812ac9e5903740f0a2189665356d0a5e0b9c3aca34e5b8b36806a4a21b7bb4489a2985dc7c7f3294dab11915')
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
