# Maintainer: metaneutrons
pkgname=snapdog-client
pkgver=0.20.0
pkgrel=1
pkgdesc="SnapDog multiroom audio client with F32+LZ4 codec, parametric EQ, and encryption"
arch=('x86_64' 'aarch64')
url="https://github.com/metaneutrons/snapdog"
license=('GPL-3.0-only')
depends=('alsa-lib' 'avahi')
makedepends=('cargo')
backup=('etc/default/snapdog-client')
source=("snapdog-$pkgver.tar.gz::https://github.com/metaneutrons/snapdog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "snapdog-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "snapdog-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p snapdog-client
}

package() {
  cd "snapdog-$pkgver"
  install -Dm755 "target/release/snapdog-client" "$pkgdir/usr/bin/snapdog-client"
  install -Dm644 "snapdog-client/systemd/snapdog-client.service" "$pkgdir/usr/lib/systemd/system/snapdog-client.service"
  install -Dm644 "snapdog-client/debian/snapdog-client.default" "$pkgdir/etc/default/snapdog-client"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
