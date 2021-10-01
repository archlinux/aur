# Maintainer: David Wu <xdavidwuph@gmail.com>
# Contributors: Christopher Pence <chris@pencels.net>

pkgname=xscreensaver-backends
_srcname=xscreensaver
pkgver=6.01
pkgrel=1
pkgdesc="Screensavers from XScreenSaver for common frontends"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
conflicts=('xscreensaver' 'xscreensaver-hacks' 'mate-screensaver-hacks')
depends=('libxmu' 'glu' 'libxi')
makedepends=('bc' 'intltool' 'libxslt' 'openmotif')
source=(http://www.jwz.org/xscreensaver/${_srcname}-${pkgver}.tar.gz
	LICENSE
	migrate-xscreensaver-config.sh
	xscreensaver-config.xsl)
sha1sums=('5e6bf477d14b8a4a07e65ac2fd32b7b7f71e422b'
          '3eedb8b91b13c29df9b1fe5cbb027e1470b802d2'
          '19195ef59f0dbc61c6ed599a968213a8f0a7a5d4'
          'e561e36c7bae61c3f5da65e4fb19a22e698f4584')
noextract=(${_srcname}-${pkgver}.tar.gz)

prepare() {
  bsdtar -xf ${_srcname}-${pkgver}.tar.gz || true
}

build() {
  cd ${_srcname}-${pkgver}
  # need either motif or gtk2 for settings, but we do not pack it
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --with-gl --with-motif \
    --without-gle --with-pixbuf --with-jpeg
  make
}

# thanks to aur/mate-screensaver-hacks for .desktop script

package() {
  cd ${_srcname}-${pkgver}
  make install_prefix="${pkgdir}" install
  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -r "${pkgdir}/usr/bin" "${pkgdir}/usr/share/locale" "${pkgdir}/usr/share/man/man1" "${pkgdir}/usr/share/X11"
  mkdir -p "${pkgdir}/usr/share/applications/screensavers/"
  cd "${pkgdir}/usr/share/applications/screensavers/"
  sh "${srcdir}/migrate-xscreensaver-config.sh" "${pkgdir}/usr/share/xscreensaver/config/*.xml"
  rm -r "${pkgdir}/usr/share/xscreensaver"
  # popsquares exists on most frontends
  rm "${pkgdir}/usr/share/applications/screensavers/popsquares.desktop"
}
