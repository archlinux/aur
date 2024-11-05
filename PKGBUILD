# Maintainer: CsiPA0723 <csizipeti0723 at gmail dot com>
_pkgname=weylus
pkgname="$_pkgname-community-git"
pkgver=2024.9.10.gbe2ca4e
pkgrel=2
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/electronstudio/WeylusCommunityEdition"
license=("AGPL-3.0-or-later")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git")
provides=("$_pkgname=${pkgver/\.r*/}")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust typescript gcc libx11 pkg-config git make cmake npm pnpm)
depends=(libxtst libxcursor libxinerama libxft libxrandr libxcomposite libdrm libva ffmpeg dbus gst-plugins-base-libs)
optdepends=("gst-plugin-pipewire: Wayland and or pipewire support")
source=("$_pkgname::git+$url.git")
sha256sums=("SKIP")

prepare() {
  export CARGO_HOME=$SRCDEST/.cargo
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname" || return
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  local _major
  local _git
  cd "$_pkgname" || return
  _major=$(grep -m 1 "version =" Cargo.toml | sed 's/version = "\(.*\)"/\1/;s/-/./g')
  _git=$(git describe --always --long --tags --abbrev=7 | sed 's/[^-]*-g\([^-]*\)/\1/;s/-/./g')
  echo "$_major.g$_git"
}

build() {
  export CARGO_HOME=$SRCDEST/.cargo
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cd "$_pkgname" || return
  cargo build --frozen --release --features="ffmpeg-system"
}

package() {
  cd "$_pkgname" || return
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/share/applications/weylus.desktop" "weylus.desktop"
}
