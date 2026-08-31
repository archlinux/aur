# Maintainer: andeen171 <zeanderpreys@gmail.com>
pkgname=g15-cli
pkgver=0.3.0
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
  'hyprpicker: pick colors from the screen in the TUI and the bar plugin'
  'polkit: password prompt for the power and fan controls in the bar plugin'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e996ad4bf99d98611d1f4868fc5c6718b75294f121e5fc0573a220b66aed5d79')

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
  install -Dm644 org.andeen171.g15.policy \
    "$pkgdir/usr/share/polkit-1/actions/org.andeen171.g15.policy"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 protocol.md "$pkgdir/usr/share/doc/$pkgname/protocol.md"
}
