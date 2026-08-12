# Maintainer: Akrm Al-Hakimi <akrm@cachebag.sh>
pkgname=blurs
pkgver=0.1.0
pkgrel=1
pkgdesc="A tiny Bluetooth applet for Wayland/Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/cachebag/blurs"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('bluez: the Bluetooth daemon blurs drives over D-Bus'
            'bluez-utils: bluetoothctl, for anything blurs does not cover'
            'python-pywal: wallpaper-derived colors')
# The release profile already strips symbols, so a debug package would be empty.
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a4b7d7087826a1bfc46e1fa094d0b13febbbdc62164d5859a5ccd8313a15fc02')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
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
  # Not --release: the release profile is panic=abort, which the test harness
  # cannot build against.
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}
