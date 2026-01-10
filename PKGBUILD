# Maintainer: galister <galister-dev at pm dot me>

pkgname=wayvr
pkgver=26.1.0
pkgrel=1
pkgdesc="Your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support)"
url="https://github.com/wlx-team/wayvr"
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
export CMAKE_POLICY_VERSION_MINIMUM=3.5
export SHADERC_LIB_DIR=/usr/lib

prepare() {
  cd "$pkgname-$pkgver"
  cd "$pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cd "../${pkgname}ctl"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  cd "$pkgname"
  cargo build --frozen --release --all-features
  cd "../${pkgname}ctl"
  cargo build --frozen --release --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cd "$pkgname"
  cargo build --frozen --release --all-features
  cd "../${pkgname}ctl"
  cargo build --frozen --release --all-features
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}ctl"
  cd "wayvr"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/" "$pkgname.png"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "$pkgname.svg"
}

