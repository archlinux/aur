# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

pkgname=autofirma
pkgver=1.6.1
pkgrel=1
pkgdesc='Spanish Government digital signature client'
arch=('i686' 'x86_64')
url='http://firmaelectronica.gob.es'
license=('GPL' 'EUPL')
depends=('java-runtime=8' 'nss' 'firefox')
makedepends=('binutils')
source=('http://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux.zip')
md5sums=('7a9b303bab747e84290f4d36c0261662')
sha512sums=('e7352c513686a33371ce9e00ef8da877f619930c60519131d9ab94b67a2e399f18f94bde162f09ba4582a9ef40d4226afbbb005ce35011872b8f69218347b6a9')

prepare() {
	ar -x AutoFirma_`echo "${pkgver}"| tr '.' '_'`.deb
	tar -xf data.tar.xz
}

package() {
	mkdir -p "${pkgdir}"/usr/lib/firefox/defaults/pref/
	cp -d --no-preserve=ownership etc/firefox/pref/AutoFirma.js "${pkgdir}"/usr/lib/firefox/defaults/pref/
	cp -dr --no-preserve=ownership usr "${pkgdir}"/

	mkdir -p "${pkgdir}"/usr/share/licenses/autofirma/
	ln -s /usr/share/doc/AutoFirma/copyright "${pkgdir}"/usr/share/licenses/autofirma/LICENSE

    java -jar "${pkgdir}"/usr/lib/AutoFirma/AutoFirmaConfigurador.jar
	mkdir -p "${pkgdir}"/usr/share/ca-certificates/trust-source/anchors
	mv "${pkgdir}"/usr/lib/AutoFirma/AutoFirma_ROOT.cer "${pkgdir}"/usr/share/ca-certificates/trust-source/anchors/AutoFirma_ROOT.cer

	chmod 644 "${pkgdir}"/usr/share/applications/afirma.desktop
	chmod 644 "${pkgdir}"/usr/share/doc/AutoFirma/copyright
}
