# Maintaner: Sergey A. <murlakatamenka@disroot.org>

pkgname=wl-clip-persist
pkgver=0.4.3
pkgrel=1
pkgdesc='Keep Wayland clipboard even after programs close'
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/Linus789/wl-clip-persist"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  'wl-clip-persist.service')
sha256sums=('83df75502cf5699e71cd022730ae7c87d0cceaea396be83120643e9aa2b96d97'
            '1687ab3e37573085ddd74e6cc2c58bd189e2ba62379f7846d07c5f38c21d0518')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable

  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"

  install -Dm 644 "$srcdir/$pkgname.service" \
    -t "$pkgdir/usr/lib/systemd/user/"

  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
