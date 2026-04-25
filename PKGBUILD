# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
pkgname=niri-dinit
pkgver=26.04
pkgrel=1
pkgdesc="A scrollable-tiling Wayland compositor (with dinit dependency instead of systemd)"
arch=('x86_64')
url="https://github.com/YaLTeR/niri"
license=('GPL-3.0-or-later')
depends=(
    'libpipewire'
    'pango'
    'glib2'
    'cairo'
    'libdisplay-info'
    'mesa'
    'libseat.so'
    'libudev.so'
    'libinput'
    'pixman'
    'libxkbcommon'
    'gcc-libs'
    'glibc'
    'dbus-dinit-user'
)
makedepends=(
    'git'
    'cargo'
    'clang'
)
optdepends=(
  'alacritty: suggested cross-platform OpenGL terminal emulator'
  'fuzzel: suggested Wayland application launcher'
  'gnome-keyring: org.freedesktop.secrets portal implementation'
  'mako: suggested Wayland notification daemon'
  'swaybg: suggested Wayland wallpaper tool'
  'swaylock: suggested Wayland screen locking utility'
  'swayidle: suggested Wayland idle management daemon'
  'waybar: suggested Wayland highly customizable desktop bar'
  'xdg-desktop-portal-gtk: XDG desktop portal that implements most functionality'
  'xdg-desktop-portal-gnome: XDG desktop portal that supports screencasting'
  'xwayland-satellite: Rootless Xwayland integration to run X11 apps'
)
provides=("niri=${pkgver}")
conflicts=("niri")
options=(!lto)
_tag=8ed0da44d974c32c6877d2f4630c314da0717ecb # git rev-parse "v$pkgver"
source=("git+${url}.git#tag=${_tag}")
sha256sums=('0a1f3e11002f2e57ee83da4a8f5dd86ae820adde111c809cf0fc65021fadf971')

prepare() {
    cd "$srcdir/niri"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$(pwd)/.cargo"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/niri"
    export RUSTFLAGS="--remap-path-prefix=$srcdir=/"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$(pwd)/.cargo"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features dinit,dbus,xdp-gnome-screencast
}

package() {
    cd "$srcdir/niri"
    install -Dm755 "target/release/niri"           -t "$pkgdir/usr/bin/"
    install -Dm755 "resources/niri-session"        -t "$pkgdir/usr/bin/"
    install -Dm644 "resources/niri.desktop"        -t "$pkgdir/usr/share/wayland-sessions/"
    install -Dm644 "resources/niri-portals.conf"   -t "$pkgdir/usr/share/xdg-desktop-portal/"
    install -Dm644 "resources/dinit/niri"          -t "$pkgdir/usr/lib/dinit.d/user/"
    install -Dm644 "resources/dinit/niri.target"   -t "$pkgdir/usr/lib/dinit.d/user/"
    install -Dm644 "resources/default-config.kdl"  -t "$pkgdir/usr/share/doc/$pkgname/"
}
