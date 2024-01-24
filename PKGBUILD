# Maintainer: Jiri Pospisil <jiri@jpospisil.com>
pkgname=ntpd-rs
pkgver=1.1.1
pkgrel=1
pkgdesc='A full-featured implementation of the Network Time Protocol, including NTS support.'
url='https://github.com/pendulum-project/ntpd-rs'
arch=('x86_64')
makedepends=('cargo')
license=('Apache')
changelog=CHANGELOG
source=(
  "https://github.com/pendulum-project/ntpd-rs/archive/refs/tags/v$pkgver.tar.gz"
  'ntpd-rs.service'
  'ntpd-rs-metrics.service')
backup=('etc/ntpd-rs/ntp.toml')
b2sums=('6e7bbce94dd6058c1bdd922b941b061baca8ba4747321485511529576a5c913653f8b33006fa3bb88f9089eea9478f88e96489a68a4eec3a970f6684fc502346'
        'b9c730d0e277de99bf7a968cedefce5bd55dfc8587dee2f140a800c0571312dd1789722dceeadd53fc04a684f6c18751106b4242f010e4991afa13f986a7c4be'
        '80355c29433138805efd4acbdb6c684a206afae43f75466d3996c100dea534d099049131279ad8d1e5c80ebaa6792b7101cccad91d085e5630c5356c295a3c22')

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --target "$CARCH-unknown-linux-gnu"
}

package() {
  install -Dm644 ntpd-rs.service "$pkgdir/usr/lib/systemd/system/ntpd-rs.service"
  install -Dm644 ntpd-rs-metrics.service "$pkgdir/usr/lib/systemd/system/ntpd-rs-metrics.service"

  cd "$pkgname-$pkgver"

  install -Dm644 docs/examples/conf/ntp.toml.default "$pkgdir/etc/ntpd-rs/ntp.toml"
  install -Dm755 -t "$pkgdir/usr/bin" target/x86_64-unknown-linux-gnu/release/{ntp-daemon,ntp-ctl,ntp-metrics-exporter}

  install -Dm755 -t "$pkgdir/usr/share/man/man8" docs/precompiled/man/{ntp-daemon.8,ntp-ctl.8,ntp-metrics-exporter.8}
  install -Dm755 -t "$pkgdir/usr/share/man/man5" docs/precompiled/man/ntp.toml.5
}
