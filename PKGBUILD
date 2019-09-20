# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

pkgname=autofirma
pkgver=1.6.5
pkgrel=2
pkgdesc='Spanish Government digital signature client'
arch=('i686' 'x86_64')
url='http://firmaelectronica.gob.es'
license=('GPL' 'EUPL')
depends=('java-runtime=8' 'nss' 'firefox')
makedepends=('binutils')
source=('http://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux.zip')
md5sums=('35622984239cad1b959a998b88224a02')
sha512sums=('927b67a93c111f1d040e38d26122f7a9d7b8d41599da776fa2895fd97409696d4a97663f4b5b4fea32e6d613e21f104cabd2c860f719954cf954e081dc3a727d')

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
