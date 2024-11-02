# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.19.3
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-settings/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo' 'garcon' 'libxfce4ui>=4.19.5' 'xfconf' 'libnotify' 'libcanberra'
         'colord' 'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra'
         'wayland' 'gtk-layer-shell')
makedepends=('xf86-input-libinput' 'glib2-devel')
optdepends=('python: xfce4-compose-mail -- "mailto:" URI handling')

provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2"
        'enable-antialias-by-default.patch')
sha256sums=('30c2659a266240b6d2950bf2cf7ab86b70372e127cd092385693c26fb928aa43'
            '25176aa463740d344c194d94771b7bfd9550809fd2ecd0e86acceb925afcf1ac')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Enable font hinting by default
  patch -uNp2 -r- -i ../enable-antialias-by-default.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --enable-xrandr \
    --enable-xcursor \
    --enable-libnotify \
    --enable-libxklavier \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
