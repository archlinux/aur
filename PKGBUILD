# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=cartaodecidadao
pkgver=3.0.13
_rev=${pkgver##*.}
_ver=${pkgver%.*}
pkgrel=1
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('GPL2' 'LGPL3' 'custom:EUPL')
depends=('java-runtime-openjdk'
         'qt5-base'
         'qt5-tools'
         'qt5-quickcontrols2'
         'qt5-graphicaleffects'
         'pcsclite>=1.5.0'
         'openssl-1.0'
         'ccid'
         'poppler-qt5'
         'xerces-c'
         'xml-security-c-ria')
makedepends=('swig' 'subversion')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
            'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
            'ecce-gov-pt-certificates: Certificados da ECCE (quem assina dos certificados contidos em cartaodecidadao-pki)')

#source=("svn+https://svn.gov.pt/projects/ccidadao/repository/middleware-offline/tags/version${_ver}-${_rev}/source/_src/eidmw"
source=("svn+https://svn.gov.pt/projects/ccidadao/repository/middleware-offline/tags/version${pkgver}/_src/eidmw"
        "00-fix_certs_path.patch"
        "01-fix_pteiddialogsQTsrv_path.patch"
        "02-fix_missing_qicon.patch"
        "03-fix_for_java_versions.patch")

sha512sums=('SKIP'
            '0c2e434ee00d0b0b3f40d32bd7926d43332d9b1a0adb8d1ef53bd0a357caff92765ab6081207051ef94b7e5ad6800031573bfdb5ed9b45c956414ab6e2f89571'
            'f47e75015582fddd0e97995ec27103fd26e5c72e987dc927cbbc0cd152522579115f3853bf727f4090b4689861fc7a9803c00ce1776b701d2a595c692fed1eb2'
            '2dc3e36d76024a08db8f9a78b9af986ece4391d09514626dbfe084d827cab634c2f55a79024611ca98e38fb23f472cecaf9c32070c92f165878040bd6b94ccd4'
            'e97bc2c5aca688345283abe353e64373a28ab92a0d8d668a165800aa16d72be4dcb7e0de619e2595ef42499203bacaa91aea7d79098059550d3ca056236d7289')

prepare() {
	chmod +x ${srcdir}/eidmw/configure

	sed -i -e "s|CFLAGS ?=|CFLAGS +=|g" ${srcdir}/eidmw/FreeImagePTEiD/Makefile.gnu
	sed -i -e "s|CXXFLAGS ?=|CXXFLAGS +=|g" ${srcdir}/eidmw/FreeImagePTEiD/Makefile.gnu
	sed -i -e "s|local/||g" ${srcdir}/eidmw/FreeImagePTEiD/Makefile.gnu

	sed -i -e "s|local/||g" ${srcdir}/eidmw/pteid-poppler/poppler/Makefile

	sed -i -e "/^INSTALLS/d" ${srcdir}/eidmw/eidmw.pro

	cd ${srcdir}/eidmw
	patch -p0 < ${srcdir}/00-fix_certs_path.patch
	patch -p0 < ${srcdir}/01-fix_pteiddialogsQTsrv_path.patch
	patch -p0 < ${srcdir}/02-fix_missing_qicon.patch
	patch -p0 < ${srcdir}/03-fix_for_java_versions.patch
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
	install -Dm644 ${srcdir}/eidmw/debian/pteid-mw-gui.desktop ${pkgdir}/usr/share/applications/pteid-mw-gui.desktop
	install -Dm644 ${srcdir}/eidmw/debian/pteid-dss.desktop ${pkgdir}/usr/share/applications/pteid-dss.desktop
	sed -i -e "s|local/bin|share/${pkgname}|g" ${pkgdir}/usr/share/applications/pteid-dss.desktop

	# Install image files
	install -Dm644 ${srcdir}/eidmw/debian/pteid-signature.png ${pkgdir}/usr/share/pixmaps/pteid-signature.png
	install -Dm644 ${srcdir}/eidmw/debian/pteid-scalable.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/pteid-scalable.svg

	# Install MIME Types
	install -Dm644 ${srcdir}/eidmw/debian/pteid-mw.sharedmimeinfo ${pkgdir}/usr/share/mime/packages/pteid-mw.xml

	# Install certificates
	install -Dm644 -t ${pkgdir}/usr/share/${pkgname}/certs/ ${srcdir}/eidmw/misc/certs/*
}
