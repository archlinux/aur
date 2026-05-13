# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfwl4
pkgname=${_pkgname}-git
_pkgver=0.1.0dev
pkgver=r456+993a0e8
pkgrel=1
pkgdesc="Wayland compositor for xfce4 (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://gitlab.xfce.org/kelnos/xfwl4"
license=('GPL-3.0-or-later')
groups=('xfce4-git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${_pkgver}")
depends=('gtk3' 'xfconf>=4.21.1' 'libxfce4ui>=4.21.4' 'libdisplay-info' 'libdrm' 'libinput' 'mesa' 'pixman'
         'seatd' 'libxkbcommon' 'xorg-xwayland')
makedepends=('cargo' 'rust' 'git' 'meson' 'gettext')
source=("${_pkgname}::git+https://gitlab.xfce.org/kelnos/xfwl4")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # Once there are (pre)release tags I'll version it as 
  # release + commits since release + short git tag
  printf 'r%s+%s' `git rev-list --count HEAD` `git rev-parse --short HEAD`
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
