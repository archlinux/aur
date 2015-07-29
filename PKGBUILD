# Maintainer: lks <lukas dot graetz at web dot de>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: sqwishy <sqwishybon@gmail.com>
# Contributor: Duologic


_pkgname=links
pkgname=links-g-directfb
pkgver=2.9
pkgrel=2
pkgdesc="A text WWW browser, similar to Lynx (with directfb, X and fb graphics)"
arch=('i686' 'x86_64')
url="http://links.twibright.com/"
license=('GPL')
# 'libx11' 'libxt' packages are for the x11 backend
# 'directfb' package is for the directfb backend
depends=('bzip2' 'xz' 'openssl' 'gpm' 'directfb'    'libx11' 'libtiff' 'libpng' 'libjpeg-turbo')
makedepends=('libxt')
provides=('links' 'links-g')
conflicts=('links' 'links-g')
replaces=('links-g')
source=(http://links.twibright.com/download/${_pkgname}-${pkgver}.tar.bz2 links.desktop)
sha1sums=('1202f1ade1075fa4f62e343702e5a0a22cdc2b13'
          'a2084166ef252175f14805f2e6a4467c45c51477')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
  cd ${_pkgname}-${pkgver}
  (cd intl; ./gen-intl; ./synclang)
  ./configure --prefix=/usr --mandir=/usr/share/man --enable-javascript \
    --enable-graphics --with-x --with-fb --with-directfb
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}/links.desktop" "${pkgdir}/usr/share/applications/links.desktop"
  install -d "${pkgdir}/usr/share/pixmaps"
  install -m644 links_16x16_1.xpm links_16x16_2.xpm links_32x32.xpm "${pkgdir}/usr/share/pixmaps/"

  install -d "${pkgdir}/usr/share/doc/links/calibration"
  install -m644 doc/links_cal/* "${pkgdir}/usr/share/doc/links/calibration/"
}
