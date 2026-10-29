# Maintainer: GreyXor <greyxor@protonmail.com>

pkgname=automatic-timezoned
pkgver=2.0.163
pkgrel=1
pkgdesc='Daemon to automatically update the system timezone based on location'
url='https://github.com/maxbrunet/automatic-timezoned'
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('geoclue' 'glibc' 'libgcc' 'systemd')
optdepends=('polkit: run the daemon as a non-root user')
makedepends=('cargo')
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('c91d0266890f3a7ce27ac88d242d7d2f3458e97e0129975f7e5e879c63f6eb1639bba236a82a61a7addfa08822605310cc29a79907904b1d4146b345aa323717')

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
