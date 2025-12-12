# Maintainer: galister <galister at librevr dot org>

_pkgname=wlx-overlay-s
pkgname=$_pkgname-git
pkgver=25.4.2.r262.4f78825
pkgrel=1
pkgdesc="Access your Wayland/X11 desktop from SteamVR/Monado (OpenVR+OpenXR support)"
url="https://github.com/galister/wlx-overlay-s"
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'fontconfig' 'freetype2' 'libxkbcommon' 'dbus' 'libpipewire' 'alsa-lib' 'openxr' 'openvr')
makedepends=('git' 'cargo' 'python3' 'cmake' 'clang' 'shaderc' 'libx11' 'libxext' 'libxrandr' 'libxkbcommon-x11')
conflicts=("$_pkgname")
provides=("$_pkgname")
source=("$_pkgname::git+https://github.com/galister/wlx-overlay-s.git")
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
  cd "$_pkgname/$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname/$_pkgname"
  cargo build --frozen --release --all-features
}

check() {
  cd "$_pkgname/$_pkgname"
  cargo test --frozen --all-features
}

package() {
  cd "$_pkgname/"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  cd "$_pkgname/"
  install -Dm0644 -t "$pkgdir/usr/share/applications/" "$_pkgname.desktop"
  install -Dm0644 -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/" "$_pkgname.png"
}
