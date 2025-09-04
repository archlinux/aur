# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=thunar-vcs-plugin
pkgname=${_pkgname}-git
pkgver=0.4.0+13+gb0421a7
pkgrel=1
pkgdesc="SVN and GIT integration for Thunar."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('GPL-2.0-or-later')
url="https://docs.xfce.org/xfce/thunar/thunar-vcs-plugin"
depends=('thunar' 'git' 'subversion' 'apr')
makedepends=('meson' 'git' 'xfce4-dev-tools')
provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/thunar-plugins/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

build() {
  local meson_options=(
    --localstatedir=/var
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
