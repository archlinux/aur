# Maintainer: Conrad Hoffmann <ch@bitfehler.net>
pkgname=dmos
pkgver=0.7.0
pkgrel=1
pkgdesc="Djot HTML renderer with advanced features"
arch=('x86_64')
url="https://sr.ht/~bitfehler/dmos"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'oniguruma')
makedepends=('rust' 'make' 'pkgconf' 'scdoc')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~bitfehler/dmos/archive/$pkgver.tar.gz")
sha512sums=('9ffd67de45cd0166b42b9c5720a664a8fb2bab2afbc4adc130dc013a7e3ee29e0a09a4c9a183f8692400bdbb56f75f6b3d7e6c510dc835574027be194305f94d')
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
