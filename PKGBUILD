# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfdesktop
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=2
pkgdesc="A desktop manager for Xfce (development release)"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://docs.xfce.org/xfce/xfdesktop/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('thunar' 'garcon' 'hicolor-icon-theme' 'libwnck3'
         'libxfce4windowing>=4.19.3' 'gtk-layer-shell')
conflicts=('xfce4-menueditor' "${_pkgname}")
provides=("${_pkgname}=${pkgver}")
replaces=('xfce4-menueditor')
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2"
        'libxfce4windowing_4.19.3_fix.patch::https://gitlab.xfce.org/xfce/xfdesktop/-/commit/4b271cb6107f3212c0cbdeee342d5dce00ed16f6.patch')

sha256sums=('b47b49ebf2990aedc640ac5bf3dce6a1ed610a7b05c93d8b69bd272c4b6b77e5'
            '1ab50069efe1cd026f62ed566c7f444f6033cf55f006e950e881c5d75b7cffeb')

prepare() {
  cd "${_pkgname}-${pkgver}"
  patch -Np1 -i ../libxfce4windowing_4.19.3_fix.patch
}

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-thunarx \
    --enable-notifications \
    --enable-wayland \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
