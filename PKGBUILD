# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.17.2
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo' 'libxfce4util>=4.17.2' 'garcon' 'libxfce4ui>=4.17.0' 'xfconf' 'libnotify' 'colord'
         'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra' 'python')
makedepends=('intltool')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2"
        'default-xsettings-xml.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/xfce4-settings/trunk/default-xsettings-xml.patch')
sha256sums=('f47089ca5e8efc20b17900555a5cde7177af223995d85ef5211fa1074447388f'
            '8e9a6c70ab0ceb5d91b637dc290768f8a47edb5d7b6e2eebc4459dbc4ee040d7')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Enable Adwaita theme and font hinting by default
  patch -Np1 -i ../default-xsettings-xml.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
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
