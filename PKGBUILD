# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: sebalis <sebalis@gmx.net>
_base=Celestia
pkgname=${_base,,}
pkgver=1.6.4
pkgrel=4
pkgdesc="Real-time space simulation"
arch=(x86_64)
license=(GPL-2.0-or-later)
url="https://${pkgname}project.space"
depends=(gtk2 libtheora lua gtkglext freeglut libxmu glu libjpeg-turbo mesa)
options=('!makeflags')
source=(https://github.com/${_base}Project/${_base}/archive/${pkgver}/${_base}-${pkgver}.tar.gz
  m4.patch::https://github.com/${_base}Project/${_base}/pull/2173.patch)
sha512sums=('58f5e55bcb193f89202663a2af8dbb920fa5bd4e893c0ec1884488b238d459d91ffc750b6b7a71653bdbe9e79e88d785020f9b189df8fad750bea39bf995a91c'
            'd9fe5c8d100c5eabeb177ad42a199b2591cc43cda3dd87cbc714e54654349da04c2bc76cfe3f2bf490b5e7f4b98dcc3aaf74b3a1921b50de3f1a67125f277ba1')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../m4.patch
  gettext_version="$( gettext --version | sed -ne '1 s/.* \([0-9]\+\.[0-9.]\+\)/\1/p; q' )"
  test -n "$gettext_version" || { echo "Can't determine gettext version" >&2; return 1; }
  sed -i "/AM_GNU_GETTEXT(/ a AM_GNU_GETTEXT_VERSION($gettext_version)" configure.ac
}

build() {
  cd ${_base}-${pkgver}
  autoreconf -fvi -I /usr/share/gettext/m4
  ./configure --prefix=/usr \
    --with-lua=/usr \
    --datadir=/usr/share \
    --with-gtk \
    --disable-rpath \
    --with-lua
  make
}

package() {
  cd ${_base}-${pkgver}
  make DESTDIR="${pkgdir}" MKDIR_P='mkdir -p' install
}
