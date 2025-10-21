# Maintainer: Álvaro De Quinta <blackcherry at danwin1210 dot de>

pkgname=wlx-overlay-s
pkgver=25.4.2
pkgrel=1
pkgdesc="Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support)"
url="https://github.com/galister/wlx-overlay-s"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'dbus' 'libpipewire' 'alsa-lib' 'openxr' 'openvr')
makedepends=('git' 'cargo' 'python3' 'cmake' 'clang' 'libx11' 'libxext' 'libxrandr' 'libxkbcommon-x11')
conflicts=("$pkgname")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')
options=(!lto)

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" "$pkgname.png"
}

