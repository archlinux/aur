# Maintainer: Giovanni Harting

pkgname=asus-numpad
pkgver=0.4.1
pkgrel=5
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
        '10e6cd26a818c7bafdc2bc9b8b2bb263eb42c98044bc396a495b297586ccbf11f7f5392ffea718f4ae238bafcc47edd212e6f4aca21792a918e40945241bc2c5')

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
  install -vDm755 -t "$pkgdir/usr/bin" target/release/$pkgname

  # configs
  install -vDm644 $srcdir/$pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 $srcdir/$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  mkdir -p "$pkgdir/usr/lib/udev/rules.d"
  echo 'KERNEL=="uinput", RUN+="/bin/setfacl -m u:asus_numpad:rw- /dev/uinput"' > "$pkgdir/usr/lib/udev/rules.d/99-$pkgname.rules"
  mkdir -p "$pkgdir/usr/lib/modprobe.d"
  echo -e 'i2c-dev\nuinput' > "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
