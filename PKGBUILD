# Maintainer: CsiPA0723 <csizipeti0723@gmail.com>
_pkgname=weylus
pkgname="$_pkgname-community-git"
pkgver=be2ca4e
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/electronstudio/WeylusCommunityEdition"
license=("AGPL3")
conflicts=("$_pkgname" "$_pkgname-bin")
provides=("$_pkgname=${pkgver/\.r*/}")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust typescript gcc libx11 pkg-config git make cmake)
depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
optdepends=("gst-plugin-pipewire: Wayland support")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

prepare() {
  export CARGO_HOME=$SRCDEST/.cargo
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname"
  git describe --always --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CARGO_HOME=$SRCDEST/.cargo
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$_pkgname"
  cargo build --frozen --release --features="ffmpeg-system"
}

package() {
  cd "$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/share/applications/weylus.desktop" "weylus.desktop"
}
