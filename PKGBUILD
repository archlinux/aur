# Maintainer: agzes <agzes0@proton.me>
pkgname=antiafk-rbx-sober
_pkgname=AntiAFK-RBX-Sober
pkgver=1.0.0
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
)
makedepends=('cargo' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v.$pkgver.tar.gz")
sha256sums=('2b72297f672ab8c9325dd16327b98efb99699153019bc2cf4beeed9abe1a9331')

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
