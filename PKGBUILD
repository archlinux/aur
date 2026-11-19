# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Daniel Playfair Cal <Daniel.playfair.cal@gmail.com>
# Contributor: Brad Fanella <cesura@archlinux.org>
# Contributor: Martin Wimpress <code@flexion.org>
# Contributor: Davide Depau <davide@depau.eu>

_pkgname=mate-panel
pkgname=mate-panel-git
pkgver=1.29.2.r0.g2ff4ee7c
pkgrel=1
pkgdesc="The MATE Panel"
url="https://mate-desktop.org"
arch=('x86_64')
license=('GPL-2.0-or-later AND LGPL-2.0-or-later')
depends=('dbus-glib' 'libwnck3' 'libcanberra' 'libmateweather' 'libsm' 'mate-menus' 'xorg-xrandr'
         'mate-desktop>=1.29.1' 'gtk-layer-shell' 'libxfce4windowing')
makedepends=('mate-common' 'yelp-tools' 'itstool' 'meson' 'git')
source=("git+https://github.com/mate-desktop/mate-panel")
groups=('mate-git')
sha256sums=('SKIP')
conflicts=('mate-panel-gtk3' 'mate-panel')
provides=("${_pkgname}=${pkgver%%.r*}")

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local meson_options=(
    -D gtk-doc=enabled
    -D enable-x11=enabled
    -D enable-wayland=enabled
    -D enable-eds=disabled #build failed
    -D in-process-applets=all
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
