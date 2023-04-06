# Maintainer: RAMChYLD <ramchyld@gmail.com>
# Contributor: peace885 <reyadmin@gmail.com>
# Contributor: Victor3D <webmaster@victor3d.com.br>
# Contributor: lks <lukas dot graetz at web dot de>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: sqwishy <sqwishybon@gmail.com>
# Contributor: Duologic

_pkgname=links
pkgname=links-g-directfb
pkgver=2.29
pkgrel=1
pkgdesc="A text WWW browser, similar to Lynx (with directfb, X and fb graphics)"
arch=('i686' 'x86_64' 'armv7h')
url="http://links.twibright.com/"
license=('GPL')
# 'libx11' 'libxt' packages are for the x11 backend
# 'directfb' package is for the directfb backend
depends=('bzip2' 'directfb' 'xz' 'openssl' 'gpm' 'libx11' 'libtiff' 
'libpng' 'libjpeg-turbo' 'librsvg' 'libevent')
makedepends=('libxt')
optdepends=('svgalib: svgalib support')
provides=('links' 'links-g')
# conflicts=('links' 'links-g')
# replaces=('links-g')
source=(http://links.twibright.com/download/${_pkgname}-${pkgver}.tar.bz2 links.desktop)
sha256sums=('22aa96c0b38e1a6f8f7ed9d7a4167a47fc37246097759ef6059ecf8f9ead7998'
            'e3aed7cda8ccb14295aa28508f528140541e5cc52659186d1f2c1122b0703bcc')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
  cd ${_pkgname}-${pkgver}
  (cd intl; ./gen-intl; ./synclang)
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-graphics --with-x --with-fb
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
