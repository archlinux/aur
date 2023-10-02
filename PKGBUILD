# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=ntpd-rs
pkgver=0.3.7
pkgrel=1
pkgdesc='A full-featured implementation of the Network Time Protocol, including NTS support.'
url='https://github.com/pendulum-project/ntpd-rs'
arch=('x86_64')
makedepends=('cargo')
license=('Apache')
source=(
  "https://github.com/pendulum-project/ntpd-rs/archive/refs/tags/v$pkgver.tar.gz"
  'ntpd-rs.service'
  'ntpd-rs.sysusers'
  'ntpd-rs.tmpfiles')
backup=('etc/ntpd-rs/ntp.toml')
b2sums=('6cf50633c64f79362aadea254c5173703639739277a884aaa369e6ba21e11d611f45e9e32d578e271f8e9f8e8d9ea69f6dbafbee448ff3c1a7cb3dd6b76949e4'
        '252cffc8dded82646dca6dec49342f8cd1343567c20b0e99295fb71476d4137c124c387a9d5ed81dc02fe4b5c13346c11c02c93c3b3c1b002cf69bd9fa7d3454'
        'd30f4da96152294c1f2bc063691899af71a1c0e00bd1da92dc870158c4994df6c5598c7d35037b0fb7c6767ad573a0bb32ac0d2f2426a7e44fc4622ab7bd1627'
        '0e5e1aa9380f2e118b29ab871009c470d8874cb9753f0ab638df468b45c36f02a88f07dc9a62a0e045030b0c2319c8a51e742aa5f6cc03cf61d62b2c8dc19fa1')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  install -Dm644 ntpd-rs.sysusers "$pkgdir/usr/lib/sysusers.d/ntpd-rs.conf"
  install -Dm644 ntpd-rs.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/ntpd-rs.conf"
  install -Dm644 ntpd-rs.service "$pkgdir/usr/lib/systemd/system/ntpd-rs.service"

  cd "$pkgname-$pkgver"
  install -Dm644 pkg/common/ntp.toml.default "$pkgdir/etc/ntpd-rs/ntp.toml"
  install -Dm755 -t "$pkgdir/usr/bin" target/x86_64-unknown-linux-gnu/release/{ntp-daemon,ntp-ctl,ntp-metrics-exporter}
}
