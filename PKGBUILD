# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libxfce4windowing
pkgname=${_pkgname}-git
pkgver=4.20.3+4+ga0b3c31
pkgrel=1
pkgdesc="Windowing concept abstraction library for X11 and Wayland (git checkout)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('GPL-2.0-or-later')
groups=('xfce4-git')
depends=('libwnck3' 'wayland')
makedepends=('gtk-doc' 'gobject-introspection' 'xfce4-dev-tools' 'git' 
             'wayland-protocols' 'wlr-protocols' 'vala' 'meson')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
    -D gtk-doc=true
    -D introspection=true
    -D vala=enabled
    -D tests=false
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
