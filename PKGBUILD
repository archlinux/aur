# Maintainer: smiley <smiley@archlinux.org>

pkgname=wpatui
pkgver=0.1.0
pkgrel=1
pkgdesc='Terminal front end for wpa_supplicant'
arch=('x86_64' 'aarch64')
url='https://github.com/AuthenticSm1les/wpatui'
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc' 'wpa_supplicant')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e65039dafe58811af7b5b5ad0ad4544effe67caefb373a1bdac51cabcd9f79fe')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
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
  install -Dm755 target/release/wpatui -t "$pkgdir/usr/bin"
  install -Dm644 dbus/wpatui.conf -t "$pkgdir/usr/share/dbus-1/system.d"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
