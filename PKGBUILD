# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfwl4
pkgname=${_pkgname}-git
epoch=1
pkgver=4.21.0+2+gdc0fc42
pkgrel=1
pkgdesc="Wayland compositor for xfce4 (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/xfce/xfwl4"
license=('GPL-3.0-or-later')
groups=('xfce4-git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
depends=('gtk3' 'xfconf>=4.21.2' 'libxfce4ui>=4.21.8' 'libdisplay-info' 'libdrm' 'libinput' 'mesa' 'pixman'
         'seatd' 'libxkbcommon' 'xorg-xwayland')
# Runtime only
depends+=('xfwm4' 'xfce4-settings>=4.21.2' 'xfdesktop>=4.21.0')
makedepends=('cargo' 'rust' 'git' 'meson' 'gettext')
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd ${_pkgname}
  
  git submodule init
  git submodule update
}

build() {
  local meson_options=(
    -Duse-system-gettext=true
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
