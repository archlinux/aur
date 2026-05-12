# Maintainer: urayde <urayde (at) ganyu.ru>

pkgname=niri-tearing-git
pkgver=26.04.r22.g43ce122
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor (tearing fork)"
arch=(x86_64 aarch64)
url="https://github.com/urayde/niri"
license=(GPL-3.0-or-later)
makedepends=(clang rust git)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd)
optdepends=(
  'alacritty: a suggested GPU-accelerated terminal emulator'
  'bash: for niri-session script'
  'fuzzel: a suggested Wayland application launcher'
  'mako: a suggested Wayland notification daemon'
  'org.freedesktop.secrets: for apps to rely on secrets portal'
  'swaybg: a suggested Wayland wallpaper tool'
  'swaylock: a suggested Wayland screen locker'
  'waybar: a suggested Wayland customizable desktop bar'
  'xwayland-satellite: for running X11 apps in XWayland'
  'xdg-desktop-portal-gtk: a suggested XDG desktop portal'
  'xdg-desktop-portal-gnome: a XDG desktop portal required for screencasting'
)
provides=("niri=${pkgver}")
conflicts=('niri' 'niri-git')
options=(!debug !lto !strip)
source=("${pkgname}::git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${pkgname}"
  export CARGO_HOME="${srcdir}/${pkgname}/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}"
  export CARGO_HOME="${srcdir}/${pkgname}/.cargo"
  export CARGO_TARGET_DIR=target
  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release
}

package() {
  cd "${pkgname}"
  install -Dm755 "target/release/niri" -t "${pkgdir}/usr/bin/"
  install -Dm755 "resources/niri-session" -t "${pkgdir}/usr/bin/"
  install -Dm644 "resources/niri.desktop" -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 "resources/niri-portals.conf" -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/niri"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"
}
