# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
# Contributor: PAblo Lezaeta <prflr88@gmail.com>

_pkgname=xfce4-whiskermenu-plugin
pkgname=${_pkgname}-git
pkgver=2.10.0+5+gbda8b62
pkgrel=1
pkgdesc="Alternate Xfce menu"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://docs.xfce.org/panel-plugins/xfce4-whiskermenu-plugin/start'
license=('GPL-2.0-or-later')
depends=('libxfce4ui>=4.21.0' 'accountsservice' 'garcon' 'gtk3' 'gtk-layer-shell' 'xfce4-panel')
makedepends=('git' 'meson' 'ninja')
optdepends=('mugshot: Update user details')
groups=('xfce4-goodies-git')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/panel-plugins/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    -D accountsservice=enabled
    -D gtk-layer-shell=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
