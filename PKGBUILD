# Maintainer: Mark Karlinsky <mark.devnull@gmail.com>
pkgname=niri-dinit
pkgver=25.08
pkgrel=4
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
_tag=d85b524d7c07a47345eab434f471f2b7bfa2c9c3 # git rev-parse "v$pkgver"
source=("git+${url}.git#tag=${_tag}"
        "0001-Update-libdisplay-info-and-Smithay-popup-destruction.patch")
sha256sums=('841b899aff667b1333feac47853dc12806dccd27df575ba68dbd2a682df08a77'
            'd574b6131eda1f133fbc38a270ec9fa00fe03227545e5514f9ec9920619d262e')

prepare() {
    cd "$srcdir/niri"
    patch -Np1 -i ../0001-Update-libdisplay-info-and-Smithay-popup-destruction.patch
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
    install -Dm644 "resources/dinit/niri-shutdown" -t "$pkgdir/usr/lib/dinit.d/user/"
    install -Dm644 "resources/default-config.kdl"  -t "$pkgdir/usr/share/doc/$pkgname/"
}
