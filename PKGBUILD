# Maintainer: andeen171 <zeanderpreys@gmail.com>
pkgname=g15-cli
pkgver=0.2.0
pkgrel=1
pkgdesc="Keyboard backlight, fan and power control for Dell G15 laptops (AW-ELC 187c:0550)"
arch=('x86_64')
url="https://github.com/andeen171/g15-cli"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=(
  'acpi_call: fan boost and power mode control'
  'acpi_call-dkms: fan boost and power mode control (non-stock kernels)'
  'hyprpicker: pick colors from the screen in the TUI'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ee96196a5bfd6252ab3bfeddaf0c490878b2a757121f4d41ae7a7d62607a1652')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/g15" "$pkgdir/usr/bin/g15"
  install -Dm644 99-g15-led.rules "$pkgdir/usr/lib/udev/rules.d/99-g15-led.rules"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 protocol.md "$pkgdir/usr/share/doc/$pkgname/protocol.md"
}
