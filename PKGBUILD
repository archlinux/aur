# Maintainer: user14923929 <user14923929@users.noreply.github.com>
pkgname=espboot
pkgver=0.1.0
pkgrel=1
pkgdesc='fastboot-style command line front end for esptool'
arch=('x86_64' 'aarch64')
url='https://github.com/user14923929/espboot'
license=('GPL-3.0-or-later')
depends=('esptool' 'systemd-libs')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee88520fb4431d7619ab1660dfa5848213bb61d6875347183f803e37aa6db318')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 packaging/70-espboot.rules "$pkgdir/usr/lib/udev/rules.d/70-espboot.rules"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
