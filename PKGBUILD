# Maintainer: Jan-Espen Oversand <sigsegv at radiotube org>

pkgname=vtun-ng
_github_account=leakingmemory
pkgver=3.0.22
pkgrel=1
pkgdesc='Easy network tunneling with encryption and traffic shaping and rewrite of vtun.'
arch=(x86_64 i686 aarch64)
url="https://github.com/${_github_account}/${pkgname}"
license=(GPL-2.0-or-later)
makedepends=('cargo')
depends=('net-tools')
source=("https://github.com/${_github_account}/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('ffb8a3404eb2890c01338fef207557b8c6cbee0d54ea0eb38629c6ed412ecc95')

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm 0755 "$pkgdir/usr/share/man/man8"
  install -m 0644 vtunngd.8 "$pkgdir/usr/share/man/man8"
  install -dm 0755 "$pkgdir/usr/share/man/man5"
  install -m 0644 vtunngd.conf.5 "$pkgdir/usr/share/man/man5"
  ln -s vtunngd.8 "$pkgdir/usr/share/man/man8/vtunng.8"
  install -dm 0755 "$pkgdir/etc"
  install -m 0600 vtunngd.conf "$pkgdir/etc"
  install -dm 0755 "$pkgdir/usr/bin"
  install -m 0755 target/release/vtunngd "$pkgdir/usr/bin"
  install -dm 0755 "$pkgdir/etc/vtunngd"
  install -m 0644 scripts/sample-client.env.systemd "$pkgdir/etc/vtunngd/sample-client.env"
  install -dm 0755 "$pkgdir/usr/lib/systemd/system"
  install -m 0644 scripts/vtunngd.service.systemd "$pkgdir/usr/lib/systemd/system/vtunngd.service"
  install -m 0644 scripts/vtunngd-client.service.systemd "$pkgdir/usr/lib/systemd/system/vtunngd@.service"
}

