# Maintainer: Miguel Revilla <yo at miguelrevilla dot com>
# Contributor: Musikolo <musikolo at protonmail dot com>

pkgname=autofirma
pkgver=1.6.5
pkgrel=1
pkgdesc='Spanish Government digital signature client'
arch=('i686' 'x86_64')
url='http://firmaelectronica.gob.es'
license=('GPL' 'EUPL')
depends=('java-runtime=8' 'nss' 'firefox')
makedepends=('binutils')
source=('http://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux.zip')
md5sums=('e90a6068458f1580afc1d4bca02ebc7f')
sha512sums=('826afd27d4b7d746beb243bd13093baaaf1890d81e0b13d8fd6798484d663d428cf5c7fc3163d098acd5e0b83b6b8cd4b7460bc2fdeee224223d16ca8bf1b76d')

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
