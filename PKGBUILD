# Maintainer: mrFrok <https://github.com/mrFrok>
pkgname=lfff
pkgver=2.4.0
pkgrel=1
pkgdesc="Free, open-source firmware flasher for Android A/B devices — CLI + GUI"
arch=('x86_64' 'aarch64')
url="https://github.com/mrFrok/LibreFastbootFirmwareFlasher"
license=('GPL-3.0-only')
depends=('android-tools' 'libxkbcommon' 'fontconfig' 'libgl')
makedepends=('cargo' 'zstd' 'bzip2' 'xz' 'pkg-config')
optdepends=(
  'aria2: firmware download support'
  'payload_dumper: OTA payload extraction (cargo install payload_dumper)'
)
provides=('lfff-gui')
conflicts=('lfff-bin' 'lfff-gui-bin')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "lfff-gui.desktop::https://raw.githubusercontent.com/mrFrok/LibreFastbootFirmwareFlasher/main/lfff-gui.desktop"
  "lfff-gui.svg::https://raw.githubusercontent.com/mrFrok/LibreFastbootFirmwareFlasher/main/lfff-gui.svg"
)
sha256sums=('7ace68c1abacea6a03db508979d7246b51612fdceaf6b4bbdb3520895e6572ed' 'SKIP' 'SKIP')

prepare() {
  cd "LibreFastbootFirmwareFlasher-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "LibreFastbootFirmwareFlasher-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p lfff-cli -p lfff-gui
}

package() {
  cd "LibreFastbootFirmwareFlasher-$pkgver"
  install -Dm755 "target/release/lfff"     "$pkgdir/usr/bin/lfff"
  install -Dm755 "target/release/lfff-gui" "$pkgdir/usr/bin/lfff-gui"
  install -Dm644 "$srcdir/lfff-gui.desktop" "$pkgdir/usr/share/applications/lfff-gui.desktop"
  install -Dm644 "$srcdir/lfff-gui.svg"    "$pkgdir/usr/share/icons/hicolor/scalable/apps/lfff-gui.svg"
  install -Dm644 "README.md"  "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}