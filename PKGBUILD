# Contributor: Muhammad 'MJ' Jassim <UnbreakableMJ@gmail.com>

pkgname=yarssr
pkgver=0.2.2
pkgrel=6
pkgdesc="Yet Another RSS Reader for GNOME notification area."
arch=('i686' 'x86_64')
url="http://yarssr.sourceforge.net/"
license=('GPL')
depends=('gtk2-perl' 'glade-perl' 'perl-gtk2-trayicon' 'gnome-vfs' \
	 'perl-xml-rss' 'gnome-perl' 'perl-locale-gettext')
makedepends=('perl')
conflicts=('yarssr-svn')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
	${pkgname}.desktop)
md5sums=('1825b214043c8d37fc8bad6935f0137a' \
	 'ee7f312f9ecdcf13f8f1da0a7ce79d5c')

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  mkdir -p ${pkgdir}/usr/build
  
  perl -ne 's!\@PREFIX\@!/usr!g ; s!\@LIBDIR\@!/usr/lib/yarssr!g ; print' < src/yarssr > ${pkgdir}/usr/build/yarssr
  
  mkdir -p ${pkgdir}/usr/build/locale/en/LC_MESSAGES
  msgfmt -o ${pkgdir}/usr/build/locale/en/LC_MESSAGES/yarssr.mo src/po/en.po
  
  mkdir -p	${pkgdir}/usr/bin \
  		${pkgdir}/usr/share \
  		${pkgdir}/usr/lib/${pkgname} \
  		${pkgdir}/usr/share/locale/en/LC_MESSAGES \
  		${pkgdir}/usr/share/applications
  
  echo "Copying lib files to ${pkgdir}/usr/lib"
  cp -Rp ${srcdir}/${pkgname}-${pkgver}/lib/* \
	 ${pkgdir}/usr/lib/${pkgname}/
  echo "Copying share files to ${pkgdir}/usr/share"
  cp -Rp ${srcdir}/${pkgname}-${pkgver}/share/* \
	 ${pkgdir}/usr/share/
  
  find ${pkgdir}/usr/share -type f -exec chmod 644 "{}" \;
  find ${pkgdir}/usr/lib/${pkgname} -type f -exec chmod 644 "{}" \;
  
  install -m 0644 ${pkgdir}/usr/build/locale/en/LC_MESSAGES/yarssr.mo \
		  ${pkgdir}/usr/share/locale/en/LC_MESSAGES/
  install -m 0755 ${pkgdir}/usr/build/${pkgname} \
		  ${pkgdir}/usr/bin
  install -m 0644 ${srcdir}/${pkgname}.desktop \
		  ${pkgdir}/usr/share/applications
  rm -rf ${pkgdir}/usr/build
}
