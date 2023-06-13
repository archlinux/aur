# Maintainer: Gabriel Moura <develop@srmoura.com.br>
# Maintainer: zoorat <zoorat [at] protonmail [dot] com>

pkgname=raven-reader
pkgver=1.0.80
pkgrel=1
pkgdesc="Simple Desktop RSS Reader made using VueJS"
url="https://github.com/hello-efficiency-inc/raven-reader"
license=('MIT')
makedepends=('yarn')
depends=("libxss" "libxtst" "libappindicator-gtk2" "gtk2" "libnotify")
provides=("${pkgname}")
_pkgname="Raven Reader"
arch=('x86_64')

source=("git+https://github.com/hello-efficiency-inc/raven-reader#commit=498774f74a44e477c3b7dcfdb6b9fe57206d60d9"
        "${pkgname}.desktop"
        "package.json.patch")
sha512sums=('SKIP'
            '9fa28be0cfac906f0d6acb6be147f797999660fda207df0b282a132950e587b5db0e77c719a38892bf6bc5e1cd77e5e9e24bf9ba169fd5505abd2dcd71ed27cf'
            'cfa4d13e9169692343db5f7c0a46c8fdc1780f2db4af6d2c4e5f4ad3adc1dd3e57766732d07f7e96757f133ee09dcfcf84c493740e5d026dca766984c67486df')

prepare(){
        patch ${srcdir}/${pkgname}/package.json package.json.patch
}

build(){
	export NODE_OPTIONS=--openssl-legacy-provider
	cd ${srcdir}/${pkgname}
        yarn
        yarn electron:build 
        chmod +x ./dist_electron/"${_pkgname}-${pkgver}.AppImage"
        ./dist_electron/"${_pkgname}-${pkgver}.AppImage" --appimage-extract
}
package() {
	mkdir -p ${pkgdir}/usr
	mkdir -p ${pkgdir}/opt/$pkgname
	mkdir -p ${pkgdir}/usr/share/applications

	cp -pR ${srcdir}/${pkgname}/squashfs-root/* ${pkgdir}/opt/$pkgname/
	mv -uf ${pkgdir}/opt/$pkgname/usr/share/icons ${pkgdir}/usr/share/
	cp -Luf $pkgname.desktop ${pkgdir}/usr/share/applications/

	chmod -R 755 ${pkgdir}/opt/$pkgname/{locales,resources}
	chmod -R 755 ${pkgdir}/usr
	rm -rdf ${pkgdir}/opt/$pkgname/usr
}
