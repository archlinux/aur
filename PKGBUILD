# Maintainer: galister <galister-dev at pm dot me>

_pkgname=wayvr
pkgname=$_pkgname-git
pkgver=26.2.1.r0.a413403
pkgrel=1
pkgdesc="Your way to enjoy VR on Linux! Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support)"
url="https://github.com/wlx-team/wayvr"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'dbus' 'libpipewire' 'alsa-lib' 'openxr' 'openvr')
makedepends=('git' 'cargo' 'python3' 'cmake' 'clang' 'shaderc' 'libx11' 'libxext' 'libxrandr' 'libxkbcommon-x11')
replaces=("wlx-overlay-s-git")
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/wlx-team/wayvr.git")
sha256sums=('SKIP')
options=(!lto)

# Use debug
export CARGO_PROFILE_RELEASE_DEBUG=2
export CMAKE_POLICY_VERSION_MINIMUM=3.5
export SHADERC_LIB_DIR=/usr/lib

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
  cd "../${_pkgname}ctl"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname"
  cd "$_pkgname"
  cargo build --frozen --release --all-features
  cd "../${_pkgname}ctl"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname"
  cd "$_pkgname"
  cargo test --frozen --all-features
  cd "../${_pkgname}ctl"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}ctl"
  cd "$_pkgname/"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/128x128/apps/" "$_pkgname.png"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/" "$_pkgname.svg"
}
