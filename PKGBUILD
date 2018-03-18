# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

pkgname=autofirma
pkgver=1.6.2
pkgrel=1
pkgdesc='Spanish Government digital signature client'
arch=('i686' 'x86_64')
url='http://firmaelectronica.gob.es'
license=('GPL' 'EUPL')
depends=('java-runtime=8' 'nss' 'firefox')
makedepends=('binutils')
source=('http://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux.zip')
md5sums=('b60cf28417f65f7e1ec757158be4bfbb')
sha512sums=('239feb7e4a27c802e850e9e8b701b793c86ca514905e98b228fd09b524f925d21e37bd5d580eecd89fd4c197ad3b7cec0b43b29079534f7729055ab25549cc2a')

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
