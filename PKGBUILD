# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=fclones-gui
pkgver=0.2.0
pkgrel=3
pkgdesc='Interactive duplicate file finder and remover'
url='https://github.com/pkolaczk/fclones-gui'
arch=('x86_64')
makedepends=('cargo' 'gendesk')
depends=('gtk4' 'libadwaita')
license=('MIT')
source=(
  "https://github.com/pkolaczk/fclones-gui/archive/refs/tags/v$pkgver.tar.gz"
  'icon.png')
b2sums=('defc9bdbcf9954094593b0841db08276370d205d72c63d995cca0bfd613606b51e30d6198c690e2d0fd971a23a0ebb6993f8acd783ce8b2d50281c8e5c8cca7a'
        'bc3f8685c7e0d35fe409416d9cf1b6cf381058cf3866ffb16a0ccb3a4527045bf9fa3cf4eee6e8644cb4894da8db6fbb2a991824356e61d13c12ba3b5f4d4c38')

prepare() {
  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name FClones --categories Utility
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 target/x86_64-unknown-linux-gnu/release/fclones-gui "$pkgdir/usr/bin/fclones-gui"
}
