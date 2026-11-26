pkgname=augenblick
pkgver=0.6.0
pkgrel=1
pkgdesc="Fullscreen eye-blink overlay for X11 and Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/x71c9/augenblick"
license=('MIT')
depends=('glibc' 'libxcb')
makedepends=('rust')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/x71c9/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=("6dfe5e34f91529c7d1db34dec831b4b97029e30273490d831bca1df0df485314")

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/augenblick"
  install -Dm644 "contrib/augenblick.service" "$pkgdir/usr/lib/systemd/user/augenblick.service"
}
