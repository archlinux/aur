# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=mate-control-center
pkgname=${_pkgname}-git
pkgver=1.29.1.r20.g67791226
pkgrel=1
pkgdesc="The Control Center for MATE"
arch=(x86_64)
url='https://github.com/mate-desktop/mate-control-center'
license=(GPL-2.0-or-later)
depends=(
  accountsservice
  at-spi2-core
  cairo
  dconf
  fontconfig
  freetype2
  gdk-pixbuf2
  glib2
  glibc
  gnome-themes-extra
  gtk3
#  gtk-layer-shell
  hicolor-icon-theme
  libappindicator
  libcanberra
  libgcc
  libgtop
  libmatekbd
  libx11
  libxcursor
  libxi
  libxklavier
  libxml2
  libxss
  'marco>=1.29.0'
  mate-desktop
  mate-menus
  mate-panel
  mate-settings-daemon
  pango
  polkit
  udisks2
#  wayland
)
makedepends=(
  git
  glib2-devel
  mate-common
#  wayland-protocols
  yelp-tools
)
groups=('mate-git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%.r*}")
source=("git+https://github.com/mate-desktop/mate-control-center.git")
b2sums=('SKIP')

prepare() {
  cd "${_pkgname}"
  git submodule update --init --recursive
}

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^[vV]//'
}

build() {
  local meson_options=(
    -D wayland=disabled # seems like this doesn't build yet for missing mate-wayland-protocols
    -D accountsservice=enabled
    -D libappindicator=enabled
  )
  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
