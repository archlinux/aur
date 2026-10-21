# Maintainer: bunterbun <me@bunterbun.dev>

pkgname=steelmouse
pkgver=2.5.1
pkgrel=1
pkgdesc="System tray battery monitor for SteelSeries wireless mice"
arch=('x86_64')
url="https://github.com/yurtemre7/steel-mouse"
license=('MIT')
depends=(
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libayatana-appindicator'
  'libgcc'
  'libglvnd'
  'libxkbcommon'
  'systemd-libs'
  'wayland'
  'xdotool'
)
makedepends=('cargo')
options=('!lto' '!debug')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  '70-steelmouse.rules'
  'steelmouse.desktop')
sha256sums=('f257b5d730e45aeb4fe351d73b7f4b84b6befc60521abdfaf1f834b2b2a3225e'
            '88849859e9aac3682132a021a986e51b2a190eff6b9b42fc786304a77fca9435'
            '47b1da8725365d682766b6b594e6a71b2277cb5be083829b35cdc1d85e9ce327')

prepare() {
  cd "steel-mouse-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "steel-mouse-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "steel-mouse-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "steel-mouse-$pkgver"
  install -Dm755 target/release/steelmouse -t "$pkgdir/usr/bin/"
  install -Dm644 assets/logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/steelmouse.png"
  install -Dm644 "$srcdir/steelmouse.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/70-steelmouse.rules" -t "$pkgdir/usr/lib/udev/rules.d/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 readme.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
