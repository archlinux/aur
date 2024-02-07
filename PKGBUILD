# Maintainer: Kelvie Wong <kelvie at kelvie dot ca>
pkgname=wscreensaver-bridge-git
pkgver=0.3.1.g70a738d
pkgrel=1
pkgdesc="Bridge screensaver inhibit D-Bus interfaces to Wayland idle inhibit"
arch=('x86_64' 'aarch64')
url="https://github.com/kelvie/wscreensaver-bridge"
license=('GPL')
depends=('gcc-libs' 'dbus' 'glibc')
makedepends=('cargo' 'git')
provides=('wscreensaver-bridge')
conflicts=('wscreensaver-bridge')
source=(
  'wscreensaver-bridge::git+https://github.com/kelvie/wscreensaver-bridge.git'
  'wscreensaver-bridge.service'
)
sha256sums=('SKIP'
            'c704ffb3f08b714a07e8ffe5c34fe0fdb666ac7a8b68af5311b092d82c22a28a')


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
  install -Dm644 "../wscreensaver-bridge.service" "$pkgdir/usr/lib/systemd/user/wscreensaver-bridge.service"
}
