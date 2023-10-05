# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=ntpd-rs
pkgver=1.0.0
pkgrel=1
pkgdesc='A full-featured implementation of the Network Time Protocol, including NTS support.'
url='https://github.com/pendulum-project/ntpd-rs'
arch=('x86_64')
makedepends=('cargo')
license=('Apache')
source=(
  "https://github.com/pendulum-project/ntpd-rs/archive/refs/tags/v$pkgver.tar.gz"
  'ntpd-rs.service')
backup=('etc/ntpd-rs/ntp.toml')
b2sums=('326210ccfe346a51205c9ad122a3e7910d61c06696dda50d9f389c3c642da7317a00041173add2bf59ea1585971137fbb8cd576c8f7e3f5ad6c41f8745d218ba'
        '9846b7e6e13e5912c9d3d8a65ac9720aff7cd0875d8617ed281a56e06346257e2597cabf96ad5b3014c67ca6c2733c43e896fc4be5de74b36406558f49cce38f')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  install -Dm644 ntpd-rs.service "$pkgdir/usr/lib/systemd/system/ntpd-rs.service"

  cd "$pkgname-$pkgver"
  install -Dm644 docs/examples/conf/ntp.toml.default "$pkgdir/etc/ntpd-rs/ntp.toml"
  install -Dm755 -t "$pkgdir/usr/bin" target/x86_64-unknown-linux-gnu/release/{ntp-daemon,ntp-ctl,ntp-metrics-exporter}
}
