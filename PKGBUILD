# Maintainer: ShinKouyo <i@0x0f.dev>
# Contributor: cosmo <aur@dawnson.is>
# Contributor: FreeFull <jazz2rulez@gmail.com>
# Contributor: Julius Michaelis <gitter@liftm.de.de>
# Contributor: Nebulosa  <nebulosa2007-at-yandex-dot-ru>

_pkgname=niri
pkgname=niri-wip-git
pkgver=25.11.126.g3d1cf38
pkgrel=1
pkgdesc="Scrollable-tiling Wayland compositor (WIP branch)"
arch=(x86_64 aarch64)
url="https://github.com/niri-wm/$_pkgname"
license=(GPL-3.0-or-later)
depends=(cairo glib2 libdisplay-info libinput libpipewire libxkbcommon mesa pango pixman seatd)
makedepends=(clang rust git)
optdepends=('fuzzel: application launcher similar to rofi drun mode'
            'waybar: highly customizable Wayland bar'
            'alacritty: a cross-platform OpenGL terminal emulator'
            'mako: notification daemon for Wayland'
            'swaybg: wallpaper tool for Wayland compositors'
            'swaylock: screen locker for Wayland'
            'xdg-desktop-portal-gtk: implements most of the basic functionality'
            'xdg-desktop-portal-gnome: screencasting support'
            'gnome-keyring: implements the secret portal, for certain apps to work'
            'polkit-gnome: when apps need to ask for root permissions')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-git")
options=(!debug !lto !strip)
source=("$_pkgname::git+$url.git#branch=wip/branch")
b2sums=('SKIP')

pkgver() {
  cd "$_pkgname" || exit
  git describe --long --tags --abbrev=7 | sed 's/\(*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_pkgname" || exit
  export CARGO_HOME="${srcdir}/${_pkgname}/.cargo"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$_pkgname" || exit
  export CARGO_ENCODED_RUSTFLAGS="--remap-path-prefix=${srcdir}=/"
  export CARGO_HOME="${srcdir}/${_pkgname}/.cargo"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$_pkgname" || exit
  install -Dm755 "target/release/$_pkgname"                 -t "${pkgdir}/usr/bin/"
  install -Dm755 "resources/${_pkgname}-session"            -t "${pkgdir}/usr/bin/"
  install -Dm644 resources/default-config.kdl               -t "${pkgdir}/usr/share/doc/niri"
  install -Dm644 "resources/${_pkgname}.desktop"            -t "${pkgdir}/usr/share/wayland-sessions/"
  install -Dm644 "resources/${_pkgname}-portals.conf"       -t "${pkgdir}/usr/share/xdg-desktop-portal/"
  install -Dm644 "resources/${_pkgname}"{.service,-shutdown.target} -t "${pkgdir}/usr/lib/systemd/user/"
}
