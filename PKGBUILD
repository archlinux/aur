# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.15.1
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('exo>=4.15.1' 'garcon' 'libxfce4ui>=4.15.1' 'xfconf' 'libnotify' 'colord'
         'libxklavier' 'adwaita-icon-theme' 'gnome-themes-extra')
makedepends=('intltool')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        'default-xsettings-xml.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/default-xsettings-xml.patch?h=packages/xfce4-settings')
sha256sums=('00ef2783d90a3779d1e75a4c5d4a9e43f958b949b6f711800a17f2d2e4123c2f'
            '8e9a6c70ab0ceb5d91b637dc290768f8a47edb5d7b6e2eebc4459dbc4ee040d7')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Enable Adwaita theme and font hinting by default
  patch -Np1 -i "$srcdir/default-xsettings-xml.patch"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

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
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
