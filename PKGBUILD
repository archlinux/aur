# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-git
pkgver=4.21.0+246+g2bbc1a46
pkgrel=1
pkgdesc="Settings manager for xfce (git checkout)"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL2')
groups=('xfce4-git')
depends=('garcon' 'libxfce4ui>=4.21.2' 'xfconf' 'libnotify' 'libcanberra' 'upower'
         'colord' 'libxklavier' 'elementary-icon-theme' 'gnome-themes-extra')
makedepends=('git' 'glib2-devel' 'xfce4-dev-tools' 'xf86-input-libinput' 'wlr-protocols')
optdepends=('python: xfce4-compose-mail -- "mailto:" URI handling'
            'xiccd: for displays support in xfce4-color-settings'
            'cups: for printers support in xfce4-color-settings'
            'sane: for scanners support in xfce4-color-settings')

provides=("${_pkgname}=${pkgver%%+*}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://gitlab.xfce.org/xfce/${_pkgname}"
        'default-xsettings-xml.patch')
sha256sums=('SKIP'
            '008da8cae0251864d1bf34e2649674e0566475a423becf81e8e3f5c6acb3877d')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/^xfce-//;s/-/+/g"
}

prepare() {
  cd "${_pkgname}"
  patch -Np1 -i ../default-xsettings-xml.patch
}

build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
    -D gtk-layer-shell=enabled
    -D upower=enabled
  )

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
