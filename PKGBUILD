# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: nsz32 <nszabo2 at gmail dot com>

_pkgname=xfce4-docklike-plugin
pkgname=${_pkgname}-git
epoch=1
pkgver=0.4.3.r19.ga5708ac
pkgrel=1
pkgdesc='A modern, docklike, minimalist taskbar for XFCE (git checkout)'
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url='https://gitlab.xfce.org/panel-plugins/xfce4-docklike-plugin'
license=('GPL-3.0-or-later')
depends=('xfce4-panel' 'libxfce4windowing' 'gtk-layer-shell')
makedepends=('git' 'xfce4-dev-tools' 'meson')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=(${_pkgname})


source=(git+${url})
sha512sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	git describe --long --tags | sed "s|xfce4-docklike-plugin-||g" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
