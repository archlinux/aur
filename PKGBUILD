# Maintainer: Shorin <fcl709@outlook.com>
# Contributor: cosmo <aur@dawnson.is>
# Contributor: FreeFull <jazz2rulez@gmail.com>
# Contributor: Julius Michaelis <gitter@liftm.de.de>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

: ${_sccache:=}

pkgname=niri-shorin-fork-git
_pkgname=niri
pkgver=26.04.r183.g8b40994
pkgrel=2
pkgdesc="Niri fork with built-in screencast portal, grid, cursor enlarge, magnifier, SVG cursors, SHM screencast etc."
arch=(x86_64 aarch64)
url="https://github.com/SHORiN-KiWATA/niri"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd xdg-desktop-portal)
makedepends=(clang rust git)
[[ -n "${_sccache}" ]] && makedepends+=(sccache)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'pipewire: PipeWire daemon, required at runtime for screen casting'
            'xdg-desktop-portal-gtk: file chooser and Access impl required by the screenshot portal'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-git=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${_pkgname}-bin")
options=(!debug !lto !strip)
source=("${_pkgname}::git+https://github.com/SHORiN-KiWATA/niri.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "${_pkgname}"
  export CARGO_HOME="${srcdir}/${_pkgname}/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}"
  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"
  [[ -n "${_sccache}" ]] && export RUSTC_WRAPPER=sccache
  export CARGO_HOME="${srcdir}/${_pkgname}/.cargo"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${_pkgname}"
  install -Dm755 "target/release/${_pkgname}"                       -t "${pkgdir}/usr/bin/"
  install -Dm755 "resources/${_pkgname}-session"                    -t "${pkgdir}/usr/bin/"
  install -Dm644 resources/default-config.kdl                       -t "${pkgdir}/usr/share/doc/niri"
  install -Dm644 "resources/${_pkgname}.desktop"                    -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 "resources/${_pkgname}-portals.conf"               -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/${_pkgname}.portal"                     -t "${pkgdir}/usr/share/xdg-desktop-portal/portals/"
  install -Dm644 "resources/${_pkgname}"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"
}
