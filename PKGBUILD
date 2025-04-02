# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-git
pkgver=4.20.1+84+g7b300b96
pkgrel=1
pkgdesc="A desktop manager for Xfce (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL-2.0-or-later')
groups=('xfce4-git')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libxfce4ui>=4.21.0' 'libxfce4windowing' 'gtk-layer-shell')
makedepends=('git' 'meson' 'xfce4-dev-tools' 'glib2-devel')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D tests=false
    -D x11=enabled
    -D wayland=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
