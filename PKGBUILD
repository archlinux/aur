# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=xfig
pkgver=3.2.7
_pkgver=3.2.7
pkgrel=1
pkgdesc="An interactive drawing tool"
arch=('x86_64')
url="http://mcj.sourceforge.net/"
license=('custom')
depends=('libjpeg' 'xaw3d' 'xorg-fonts-75dpi' 'xorg-fonts-100dpi' 'libpng' 'libxpm')
optdepends=('fig2dev: to use the frontend to convert fig files')
options=('!makeflags' '!emptydirs')
source=(http://downloads.sourceforge.net/mcj/${pkgname}-${_pkgver}.tar.xz
	xfig-aspell.patch xfig-3.2.5-color-resources.patch
        LICENSE)
sha1sums=('bc426557aafb1ef9af462578d1f63c77da2858d5'
          'a57fcc3c8396d58b19061f9cdd93beea728e38e5'
          'dd41e0a007bb74b74e1af50b6b04aa6aec61ab22'
          '31edf4cfab708820ea3f114d095dfef5aa88e5aa')

prepare() {
  cd ${pkgname}-${_pkgver}
   patch -p1 -i "${srcdir}/xfig-aspell.patch"
   patch -p1 -i "${srcdir}/xfig-3.2.5-color-resources.patch"
}

build() {
  cd ${pkgname}-${_pkgver}
  ./configure --prefix=/usr
  make XFIGDOCDIR=/usr/share/doc/xfig LIBDIR=/usr/share \
    XAPPLOADDIR=/usr/share/X11/app-defaults
}

package() {
  cd ${pkgname}-${_pkgver}

  make DESTDIR="${pkgdir}" XFIGDOCDIR=/usr/share/doc/xfig LIBDIR=/usr/share \
    MANDIR=/usr/share/man/man1 XAPPLOADDIR=/usr/share/X11/app-defaults install

#  find "${pkgdir}/usr/share/xfig/Libraries" -type f -exec chmod 0644 {} \;
#  find "${pkgdir}/usr/share/xfig/Libraries" -type d -exec chmod 0755 {} \;
#  find "${pkgdir}/usr/share/doc/xfig" -type f -exec chmod 0644 {} \;
#  find "${pkgdir}/usr/share/doc/xfig" -type d -exec chmod 0755 {} \;

  install -D -m644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"	
}
