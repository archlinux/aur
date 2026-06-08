# Maintainer: martian0x80 <aur@0x80.dev>

_pkgname="framepipe"
pkgname="$_pkgname-git"
pkgver=0.1.3.r0.g1c2d43d
pkgrel=1
pkgdesc="Feature rich high performance GPU screen recorder for Linux (wayland)"
arch=('x86_64')
url="https://github.com/martian0x80/framepipe"
license=('GPL-3.0-only')
options=('!lto' '!debug')
depends=(
  'dbus'
  'libcap'
  'libdrm'
  'pipewire'
  'libva'
  'wayland'
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-base-libs'
  'gst-plugin-pipewire'
  'gst-plugins-good'
  'glib2'
  'libinput'
  'libxkbcommon'
  'libglvnd'
)
makedepends=(
  'git'
  'rust'
  'clang'
  'pkgconf'
)
optdepends=(
  'mesa: Required to record your screen AMD/Intel GPUs'
  'intel-media-driver: Required to record your screen on Intel Broadwell or later iGPUs or Intel Arc'
  'linux-firmware-intel: Required to record your screen on Intel Skylake or later iGPUs'
  'xdg-desktop-portal: Required to record your screen with pipewire on Wayland'
)

install="$_pkgname.install"

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgsrc"
  export LIBCLANG_PATH=/usr/lib
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --frozen --release --locked
}

package() {
  cd "$_pkgsrc"
  install -Dm755 "$srcdir/target/release/framepipe" "$pkgdir/usr/bin/framepipe"
  install -Dm755 "$srcdir/target/release/framepipe-privd" "$pkgdir/usr/bin/framepipe-privd"
  install -Dm755 "$srcdir/target/release/framepipe-gui" "$pkgdir/usr/bin/framepipe-gui"
}
