# Maintainer: CagedBird <cagedbird043@gmail.com>
pkgname=dingtalk-wayland-screenshare-rust-git
_pkgname=dingtalk-wayland-screenshare
pkgver=0.1.0
pkgrel=1
pkgdesc="Pure Rust rewrite of Wayland screensharing hook for DingTalk, zero-dependency drop-in replacement"
arch=('x86_64')
url="https://github.com/cagedbird043/dingtalk-wayland-screenshare"
license=('MIT')
depends=('dingtalk-bin' 'pipewire' 'xdg-desktop-portal')
makedepends=('rust' 'cargo' 'git')
provides=('dingtalk-wayland-screenshare')
conflicts=('dingtalk-wayland-screenshare' 'dingtalk-wayland-screenshare-git')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!lto' '!debug')

pkgver() {
  cd "$srcdir/$_pkgname"
  if git describe --long --tags >/dev/null 2>&1; then
    git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

prepare() {
  cd "$srcdir/$_pkgname"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$srcdir/$_pkgname"
  CARGO_TARGET_DIR=target cargo build --frozen --release
}

package() {
  cd "$srcdir/$_pkgname"
  
  # Install the compiled shared library
  install -Dm755 "target/release/libdingtalk_wayland_screenshare.so" "$pkgdir/usr/lib/dingtalk/libdingtalk_hook.so"
  
  # Install the launcher wrapper script
  install -Dm755 "dingtalk-wayland-screenshare" "$pkgdir/usr/bin/dingtalk-wayland-screenshare"
  
  # Install the desktop entry
  install -Dm644 "dingtalk-wayland-screenshare.desktop" "$pkgdir/usr/share/applications/dingtalk-wayland-screenshare.desktop"
  
  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
