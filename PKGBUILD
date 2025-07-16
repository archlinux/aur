# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libwlembed
pkgname=${_pkgname}-git
pkgver=0.0.0+r299+4d37dc9
pkgrel=1
pkgdesc="Wayland compositor library that allows you to embed surfaces from one application into another (git checkout)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/kelnos/libwlembed/"
license=('GPL-3')
depends=('libxfce4windowing' 'wayland' 'gtk-layer-shell')
makedepends=('gtk-doc' 'gobject-introspection' 'xfce4-dev-tools' 'git' 
             'wayland-protocols' 'wlr-protocols' 'meson')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s+r%s+%s" \
    $( grep '^[\ ]*version:' meson.build  | grep -E -o '[0-9]+.[0-9]+.[0-9]+' ) \
    $( git rev-list --count HEAD ) \
    $( git rev-parse --short HEAD )
    
#  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D gtk-doc=true
    -D introspection=true
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
