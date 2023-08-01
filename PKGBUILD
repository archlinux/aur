# Maintainer: Giovanni Harting

pkgname=asus-numpad
pkgver=0.4.1
pkgrel=1
pkgdesc="Linux daemon for Asus laptops to activate numpad on touchpad"
arch=(x86_64)
url="https://github.com/iamkroot/asus-numpad"
license=('MIT')
depends=(libevdev gcc-libs)
makedepends=(cargo-nightly)
source=("https://github.com/iamkroot/asus-numpad/archive/refs/tags/v$pkgver.tar.gz"
        $pkgname.{sysusers,service})
b2sums=('74bd538beb97f8455f2b6dd059bd43d6638b7db58f102d7e0e9a03455c5e80bc1be41537197fb523ad78a15314fc90904a0d5cbe635f602b9aa9e7c169eab924'
        'b9a3c0c70528cd526a1aba4e2fc61d26e132648fe4670610594a3afc4453492585869a0fcac5c64c2efb08b9e89acc03f1c1d6b6a983c75c59bb36d6887453a6'
        'e18d14283e5e9cdd565f693c5cda41b4c88ae900c7f32ca78926bbb731077c40df6ec1633d2162bf6eb1f70c9b2da2af85fc29359efcf4162e54c1be0b59ba49')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=nightly
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" target/release/asus-numpad

  # configs
  install -vDm644 $srcdir/$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 $srcdir/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim:set ts=2 sw=2 et:
