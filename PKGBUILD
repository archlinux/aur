# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n@o2.pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>

_pkgname=libxfce4ui
pkgname="${_pkgname}"-git
epoch=1
pkgver=4.21.2+140+g70067857
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4ui/start"
license=('GPL-2.0-or-later')
groups=('xfce4-git')
depends=('libxfce4util' 'gtk3' 'xfconf' 'libsm' 'startup-notification' 'libgudev'
         'libgtop' 'libepoxy' 'hicolor-icon-theme')
makedepends=('git' 'gtk-doc' 'gobject-introspection' 'vala' 'glade' 'xfce4-dev-tools' 'meson')
optdepends=('glade: Glade designer plugin')
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
    -D gtk-doc=true
    -D x11=enabled
    -D wayland=enabled
    -D glade=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
