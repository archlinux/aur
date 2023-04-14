# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=journald-broker
pkgver=0.5.0
pkgrel=1
pkgdesc="A log-based event dispatcher daemon for systemd's journal"
arch=('x86_64')
url="https://github.com/bpetlert/journald-broker"
license=('GPL-3.0-or-later')
depends=('systemd-libs')
makedepends=(cargo)
options=(!lto)
provides=("${pkgname}")
conflicts=("${pkgname}")
backup=(etc/systemd/journald-broker.toml)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('9479b91477e2c30b110662b8b1a0d931900ab58841edb8c4863d87f65e22d00b')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build  --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/journald-broker" "$pkgdir/usr/bin/journald-broker"

  install -Dm644 "journald-broker.service" "$pkgdir/usr/lib/systemd/system/journald-broker.service"

  install -Dm644 "journald-broker.toml" "$pkgdir/etc/systemd/journald-broker.toml"

  install -Dm644 "README.adoc" "$pkgdir/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
