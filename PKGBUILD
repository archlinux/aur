# Maintainer: neutral <neutral at fastmail dot com>
# Contributor: peace885 <reyadmin@gmail.com>
# Contributor: Victor3D <webmaster@victor3d.com.br>
# Contributor: lks <lukas dot graetz at web dot de>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>
# Contributor: sqwishy <sqwishybon@gmail.com>
# Contributor: Duologic

_pkgname=links
pkgname=links-g
pkgver=2.28
pkgrel=1
pkgdesc="A text WWW browser, similar to Lynx (with X graphics)"
arch=('i686' 'x86_64' 'armv7h')
url="http://links.twibright.com/"
license=('GPL')
# 'libx11' 'libxt' packages are for the x11 backend
depends=('bzip2' 'xz' 'openssl' 'gpm' 'libx11' 'libtiff' 
'libpng' 'libjpeg-turbo' 'librsvg' 'libevent')
makedepends=('libxt')
provides=('links' 'links-g')
conflicts=('links' 'links-g')
source=(http://links.twibright.com/download/${_pkgname}-${pkgver}.tar.bz2 links.desktop)
sha256sums=('2fd5499b13dee59457c132c167b8495c40deda75389489c6cccb683193f454b4'
            'e3aed7cda8ccb14295aa28508f528140541e5cc52659186d1f2c1122b0703bcc')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" configure
}

build() {
  cd ${_pkgname}-${pkgver}
  (cd intl; ./gen-intl; ./synclang)
  ./configure --prefix=/usr --mandir=/usr/share/man \
    --enable-graphics --with-x
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
