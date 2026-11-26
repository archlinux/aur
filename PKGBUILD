# Maintainer: agzes <agzes0@proton.me>
pkgname=antiafk-rbx-sober
_pkgname=AntiAFK-RBX-Sober
pkgver=1.0.1
pkgrel=1
pkgdesc="Native Linux Anti-AFK utility for Sober (Roblox)"
arch=('x86_64')
url="https://github.com/Agzes/AntiAFK-RBX-Sober"
license=('MIT')
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'libxkbcommon')
optdepends=(
    'grim: screen capture for Auto Reconnect on Hyprland, Niri, and COSMIC'
    'spectacle: screen capture for Auto Reconnect on KDE Plasma'
    'wtype: keystroke injection on Niri'
    'xdotool: window management and input fallback on X11 and i3'
    'wmctrl: window listing on X11'
    'maim: screen capture for Auto Reconnect on X11'
    'qt6-tools: qdbus6 utility for KDE Plasma 6'
)
makedepends=('cargo' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('b1e4464e2c8b902e30596500206abd099f17abe66f9d7b6f141941480d0b71ef')

prepare() {
  cd "$_pkgname-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  sed -i "s/Icon=AntiAFK-RBX-Sober/Icon=dev.agzes.$pkgname/" "dev.agzes.$pkgname.desktop"
}

build() {
  cd "$_pkgname-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$_pkgname-v.$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "$_pkgname-v.$pkgver"
  install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "dev.agzes.$pkgname.desktop" "$pkgdir/usr/share/applications/dev.agzes.$pkgname.desktop"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/dev.agzes.$pkgname.png"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/dev.agzes.$pkgname.png"
  install -Dm644 "assets/logo.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
