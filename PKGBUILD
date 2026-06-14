# Maintainer: metaneutrons
pkgname=snapdog
pkgver=0.20.0
pkgrel=1
pkgdesc="Multi-room audio system with AirPlay, Snapcast, MQTT, and KNX integration"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/snapdog"
license=('GPL-3.0-only')
depends=('alsa-lib' 'avahi')
makedepends=('cargo' 'npm')
backup=('etc/snapdog/snapdog.toml' 'etc/default/snapdog')
source=("snapdog-$pkgver.tar.gz::https://github.com/metaneutrons/snapdog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "snapdog-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "snapdog-$pkgver"
  cd webui && npm ci && npm run build && cd ..
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p snapdog
}

package() {
  cd "snapdog-$pkgver"
  install -Dm755 "target/release/snapdog" "$pkgdir/usr/bin/snapdog"
  install -Dm644 "snapdog/systemd/snapdog.service" "$pkgdir/usr/lib/systemd/system/snapdog.service"
  install -Dm644 "snapdog/debian/snapdog.default" "$pkgdir/etc/default/snapdog"
  install -Dm644 "snapdog.example.toml" "$pkgdir/etc/snapdog/snapdog.toml"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
