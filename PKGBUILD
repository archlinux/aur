# Maintainer: CsiPA0723 <csizipeti0723@gmail.com>
_pkgname=weylus
pkgname="$_pkgname-community-git"
pkgver=2024.8.3
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/electronstudio/WeylusCommunityEdition"
license=("AGPL3")
conflicts=("$_pkgname" "$_pkgname-bin")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust typescript gcc libx11 pkg-config git make cmake)
depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
optdepends=("gst-plugin-pipewire: Wayland support")
source=("${_pkgname}-${pkgver}::git+$url.git#tag=$pkgver")
sha256sums=("SKIP")

prepare() {
  export CARGO_HOME=$srcdir/.cargo
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname-$pkgver"
  git describe --exact-match --tags
}

build() {
  export CARGO_HOME=$srcdir/.cargo
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$_pkgname-$pkgver"
  cargo build --frozen --release --features="ffmpeg-system"
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/share/applications/weylus.desktop" "weylus.desktop"
}
