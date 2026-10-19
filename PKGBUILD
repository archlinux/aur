# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.160
pkgrel=1
pkgdesc='Daemon to automatically update the system timezone based on location'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('geoclue' 'glibc' 'libgcc' 'systemd')
optdepends=('polkit: run the daemon as a non-root user')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('cb15c5589f5ba927f0ca60af05b0721ab1b69213795d575934bbf692df71c4eb02488b82bd5da9b648f928c255eb856bb39dd0f9881b1e44ab5fc864956fd491')

prepare() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/examples/" examples/*
}
