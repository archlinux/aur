# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: swanson <webaake gmail com>

_pkgname=mousepad
pkgname=${_pkgname}-git
pkgver=0.6.5+113+g3e854550
pkgrel=1
pkgdesc="Simple text editor for Xfce  (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="http://www.xfce.org/"
license=('GPL-2.0-or-later')
depends=('gtksourceview4' 'desktop-file-utils' 'hicolor-icon-theme' 'gspell' 'polkit')
makedepends=('xfce4-dev-tools' 'git' 'meson')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/apps/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D gtksourceview4=enabled
    -D polkit=enabled
    -D gspell-plugin=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
