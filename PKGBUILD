# Maintainer: mrFrok <mrfrok@example.com>
pkgname=lfff
pkgver=0.2.0
pkgrel=1
pkgdesc="Free, open-source firmware flasher for Android A/B devices via fastboot"
arch=('x86_64' 'aarch64')
url="https://github.com/mrFrok/LibreFastbootFirmwareFlasher"
license=('GPL-3.0-only')
depends=('android-tools')
makedepends=('cargo' 'zstd' 'bzip2' 'xz')
optdepends=(
  'aria2: firmware download support'
  'payload_dumper: OTA payload extraction (cargo install payload_dumper)'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "LibreFastbootFirmwareFlasher-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "LibreFastbootFirmwareFlasher-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "LibreFastbootFirmwareFlasher-$pkgver"
  install -Dm755 "target/release/lfff" "$pkgdir/usr/bin/lfff"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
