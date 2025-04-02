# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL-2.0-or-later')
groups=('xfce4-devel')
depends=('garcon' 'libxfce4ui>=4.21.0' 'xfconf' 'libnotify' 'libcanberra'
         'colord' 'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra'
         'wayland' 'gtk-layer-shell')
makedepends=('meson' 'xfce4-dev-tools' 'xf86-input-libinput' 'glib2-devel')
optdepends=('python: xfce4-compose-mail -- "mailto:" URI handling'
            'xiccd: for displays support in xfce4-color-settings'
            'cups: for printers support in xfce4-color-settings'
            'sane: for scanners support in xfce4-color-settings')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz"
        'enable-antialias-by-default.patch')
sha256sums=('7190c72917577be4eeb474d9978ade4a254653b34882df784c419578f490f37a'
            'fea2dd8ace227a7e3ebaea687eae43680595d8fd6e1ade532a1e62805c5f0f14')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Enable font hinting by default
  patch -uNp2 -r- -i ../enable-antialias-by-default.patch
}

build() {
  local meson_options=(
    -D x11=enabled
    -D wayland=enabled
  )

  arch-meson "${_pkgname}-${pkgver}" build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
