# Maintainer: Kelvie Wong <kelvie at kelvie dot ca>
pkgname=wscreensaver-bridge-git
pkgver=0.3
pkgrel=1
pkgdesc="Bridge screensaver inhibit D-Bus interfaces to Wayland idle inhibit"
arch=('x86_64' 'aarch64')
url="https://github.com/kelvie/wscreensaver-bridge"
license=('GPL')
depends=('gcc-libs' 'dbus' 'glibc')
makedepends=('cargo' 'git')
provides=('wscreensaver-bridge')
conflicts=('wscreensaver-bridge')
source=('wscreensaver-bridge::git+https://github.com/kelvie/wscreensaver-bridge.git')
sha256sums=('SKIP')


pkgver() {
    cd "$srcdir/wscreensaver-bridge"
    git describe --tags --match 'v*' | sed 's/^v//;s/-/./g'
}

prepare() {
    cd "$srcdir/wscreensaver-bridge"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/wscreensaver-bridge"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release 
}

package() {
  cd "$srcdir/wscreensaver-bridge"

  install -Dm755 "target/release/wscreensaver-bridge" "$pkgdir/usr/bin/wscreensaver-bridge"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
