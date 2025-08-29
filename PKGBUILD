# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: m4sk1n <m4sk1n vivaldi net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgname=xfce4-panel
pkgname=${_pkgname}-git
pkgver=4.21.0+173+g4cbfe6ac
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-panel/start"
license=('GPL2')
groups=('xfce4-git')
conflicts=("${_pkgname}" 'xfce4-statusnotifier-plugin')
provides=("${_pkgname}=${pkgver%%+*}")
depends=('garcon' 'libxfce4ui>=4.21.0' 'libxfce4windowing' 'hicolor-icon-theme'
         'desktop-file-utils' 'xfconf' 'libdbusmenu-gtk3' 'gtk-layer-shell')
makedepends=('gtk-doc' 'git' 'xfce4-dev-tools' 'gobject-introspection' 'vala' 'glib2-devel' 'meson' 'wayland')
optdepends=('xfce4-panel-profiles')
replaces=('xfce4-statusnotifier-plugin')
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
    -D gtk-layer-shell=enabled
    -D vala=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
