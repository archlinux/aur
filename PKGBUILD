# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-git
pkgver=4.21.0+139+g76f230c1
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-power-manager/start"
license=('GPL-2.0-or-later')
groups=('xfce4-git')
depends=('libxfce4ui>=4.21.0' 'upower' 'libnotify' 'xfce4-notifyd' 'hicolor-icon-theme' 'networkmanager')
makedepends=('xfce4-panel' 'wayland-protocols' 'wayland' 'git' 'xfce4-dev-tools' 'glib2-devel' 'wlr-protocols' 'meson')
optdepends=('xfce4-panel: Xfce panel plugin support')
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
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
