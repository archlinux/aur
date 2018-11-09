# Maintainer: David Wu <xdavidwuph@gmail.com>

pkgname=xscreensaver-backends
_srcname=xscreensaver
pkgver=5.40
pkgrel=1
pkgdesc="Screensavers from XScreenSaver for common frontends"
arch=('i686' 'x86_64')
url="http://www.jwz.org/xscreensaver/"
license=('BSD')
conflicts=('xscreensaver' 'xscreensaver-hacks' 'mate-screensaver-hacks')
depends=('libxmu' 'glu' 'gdk-pixbuf2')
makedepends=('bc' 'intltool' 'libxslt')
source=(http://www.jwz.org/xscreensaver/${_srcname}-${pkgver}.tar.gz
	LICENSE
	migrate-xscreensaver-config.sh
	xscreensaver-config.xsl)
sha1sums=('82c7433fe008e6ea9ab8683cf3325a673b8a8233'
          '3eedb8b91b13c29df9b1fe5cbb027e1470b802d2'
	  '19195ef59f0dbc61c6ed599a968213a8f0a7a5d4'
	  '3b5fd07d97cce754071e6f54db681dfea482a87d')

# HAVE_GTK2 is needed to build with arch gdk-pixbuf2 even if no gtk2 installed

build() {
  cd ${_srcname}-${pkgver}
  CFLAGS="-DHAVE_GTK2" ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --libexecdir=/usr/lib --with-x-app-defaults=/usr/share/X11/app-defaults \
    --with-pam --with-gl \
    --without-gle --with-pixbuf --with-jpeg
  make
}

# thanks to aur/mate-screensaver-hacks for .desktop script

package() {
  cd ${_srcname}-${pkgver}
  install -d "${pkgdir}/etc/pam.d"
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
