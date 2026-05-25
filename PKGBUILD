# Maintainer: CsiPA0723 <csizipeti0723 at gmail dot com>
_pkgname=weylus
pkgname="$_pkgname-community-git"
pkgver=2026.5.22.r0.g1b21a9b
pkgrel=1
pkgdesc="Use your tablet as graphic tablet/touch screen on your computer."
arch=("x86_64")
url="https://github.com/electronstudio/WeylusCommunityEdition"
license=("AGPL-3.0-or-later")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git")
provides=("$_pkgname=${pkgver/\.r*/}")
options=(!debug !lto) # Disabled for rust build
makedepends=(rust pnpm libx11 pkg-config git cmake nasm)
depends=(cairo dbus gst-plugins-base-libs libdrm libva libxcomposite libxcursor libxinerama libxkbcommon libxrandr libxtst pango ffmpeg)
optdepends=("gst-plugin-pipewire: Wayland and or pipewire support")
source=("$_pkgname::git+$url.git" "community.patch")
sha256sums=("SKIP" "48a038ee689b4cf3dc7e342bcde0a1e697d2e674120db20c89e6b3190aa753c7")

prepare() {
  export CARGO_HOME=$SRCDEST/.cargo
  export RUSTUP_TOOLCHAIN=stable
  cd "$_pkgname" || return
  patch -Np1 -i ../community.patch
  # BUG: Arch typescript package is 6.0
  # FIX: Use locally installed tsc instead
  pnpm install typescript@5.5.4
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgname" || return
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  export CARGO_HOME=$SRCDEST/.cargo
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS="$CFLAGS -fno-lto"
  export CXXFLAGS="$CXXFLAGS -fno-lto"
  cd "$_pkgname" || return
  cargo build --frozen --release --features="ffmpeg-system"
}

package() {
  cd "$_pkgname" || return
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
  install -Dm0755 -t "$pkgdir/usr/share/applications/" "weylus.desktop"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
  install -Dm644 -t "$pkgdir/usr/share/icons/" "io.github.electronstudio.WeylusCommunityEdition.png"
}
