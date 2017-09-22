# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=cartaodecidadao
pkgver=2.4.0.4973
_rev=${pkgver##*.}
pkgrel=1
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('GPL2' 'LGPL3' 'custom:EUPL')
depends=('java-runtime-openjdk'
         'qt5-base'
         'qt5-tools'
         'pcsclite>=1.5.0'
         'openssl-1.0'
         'ccid'
         'poppler-qt5'
         'xerces-c'
         'xml-security-c')
makedepends=('swig')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
            'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
            'ecce-gov-pt-certificates: Certificados da ECCE (quem assina dos certificados contidos em cartaodecidadao-pki)')

source=("svn+https://svn.gov.pt/projects/ccidadao/repository/middleware-offline/tags/version${pkgver}-${_rev}/source/_src/eidmw")

sha512sums=('SKIP')

prepare() {
	chmod +x ${srcdir}/eidmw/configure

	sed -i -e "s|CFLAGS ?=|CFLAGS +=|g" ${srcdir}/eidmw/FreeImagePTEiD/Makefile.gnu
	sed -i -e "s|CXXFLAGS ?=|CXXFLAGS +=|g" ${srcdir}/eidmw/FreeImagePTEiD/Makefile.gnu
	sed -i -e "s|local/||g" ${srcdir}/eidmw/FreeImagePTEiD/Makefile.gnu

	sed -i -e "s|local/||g" ${srcdir}/eidmw/pteid-poppler/poppler/Makefile

	sed -i -e "/^INSTALLS/d" ${srcdir}/eidmw/eidmw.pro
}

build() {
	cd ${srcdir}/eidmw

	./configure  \
		--prefix=/usr \
		--include+="/usr/include/openssl-1.0/" \
		--lib+="-L/usr/lib/openssl-1.0"  \

	make
}

package() {
	cd ${srcdir}/eidmw

	# Install programs and libraries
	INSTALL_ROOT="$pkgdir" make install
	install -Dm644 ${srcdir}/eidmw/misc/DSS/dss-standalone-app-3.0.4.jar ${pkgdir}/usr/share/${pkgname}/DSS/dss-standalone-app-3.0.4.jar
	install -Dm644 ${srcdir}/eidmw/misc/DSS/config.properties ${pkgdir}/usr/share/${pkgname}/DSS/config.properties

	# Install EUPL License
	install -Dm644 ${srcdir}/eidmw/misc/licenses/License_pt.rtf ${pkgdir}/usr/share/licenses/${pkgname}/EUPL

	# Install desktop files
	install -Dm644 ${srcdir}/eidmw/debian/pteid-mw-gui.desktop ${pkgdir}/usr/share/desktop/applications/pteid-mw-gui.desktop
	install -Dm644 ${srcdir}/eidmw/debian/pteid-dss.desktop ${pkgdir}/usr/share/desktop/applications/pteid-dss.desktop
	sed -i -e "s|local/bin|share/${pkgname}|g" ${pkgdir}/usr/share/desktop/applications/pteid-dss.desktop

	# Install image files
	install -Dm644 ${srcdir}/eidmw/debian/pteid-signature.png ${pkgdir}/usr/share/pixmaps/pteid-signature.png
	install -Dm644 ${srcdir}/eidmw/debian/pteid-scalable.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/pteid-scalable.svg

	# Install MIME Types
	install -Dm644 ${srcdir}/eidmw/debian/pteid-mw.sharedmimeinfo ${pkgdir}/usr/share/mime/packages/pteid-mw.xml
}
