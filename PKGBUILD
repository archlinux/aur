# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=polo
pkgname=${_pkgname}-git
pkgver=1.0.1.r44.gfc2e022
pkgrel=1
pkgdesc="Window manager, compositor, and session authority for the MATE Wayland desktop"
arch=('x86_64')
url="https://github.com/KeremSoke/polo"
license=('GPL-3.0-or-later')
depends=('gtk3' 'gtk-layer-shell' 'wayland' 'libxkbcommon' 'libinput' 'libevdev'
         'seatd' 'systemd' 'libdisplay-info' 'lcms2' 'libcanberra' 'libsm' 'libice'
         'mate-desktop' 'libpulse' 'json-glib' 'xdg-desktop-portal-gtk')
makedepends=('git' 'vala' 'meson' 'wayland-protocols')
# The only python files are tests; I think we can skip these
# makedepends+=('python-xlib' 'python-pyyaml')
optdepends=('xdg-desktop-portal-wlr: screen sharing'
            'grim: screenshot keys'
            'xorg-xwayland: X11 applications'
            'wl-clipboard: screenshots to the clipboard'
            'slurp: area screenshots')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgname"
  meson subprojects download
}

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local meson_options=(
    -D tests=false
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
