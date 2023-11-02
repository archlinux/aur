# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=journald-broker
pkgver=0.6.0
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
b2sums=('159358efce09d9ca0a7673f3e2a662bcea6abdcca53d790b6af07c5d720558612ed938937a2cf6b2c774cd310f59fd737dffb0ad3b8b047afe24588c294c470d')

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
