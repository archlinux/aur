# Maintainer: galister <galister-dev at pm dot me>

pkgname=wayvr
pkgver=26.8.0
pkgrel=1
pkgdesc="Your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support)"
url="https://github.com/wayvr-org/wayvr"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=(glibc
         libxkbcommon
         libxkbcommon-x11
         hicolor-icon-theme
         libx11
         libstdc++
         libxcb
         openssl
         libxext
         libxrandr
         libgcc
         dbus
         libpipewire
         libinput
         alsa-lib
         openxr
         openvr
         dav1d
         xwayland-satellite)
makedepends=(git
             cargo
             python3
             cmake
             clang
             shaderc
             vulkan-headers)
replaces=("wlx-overlay-s")
conflicts=("$pkgname")
provides=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("8db6d52b8be462b132d05c119b526094bef9fbe4b8b605dec44e5979f41256ef")
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

package() {
  cd "$pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname}ctl"
  cd "$pkgname"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/" "$pkgname.png"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "$pkgname.svg"
}

