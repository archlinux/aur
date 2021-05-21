# Maintainer: Lukas1818 <aur at lukas1818 dot de>

pkgname=gog-ftl
_name=gog-ftl-advanced-edition
epoch=1
pkgver=1.6.12
pkgrel=1
pkgdesc="Spaceship simulation roguelike-like (GOG version). Take your ship and crew through a randomly generated galaxy filled with glory and bitter defeat."
url="https://www.gog.com/game/faster_than_light"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('lgogdownloader' 'sed')
provides=("ftl=$pkgver")
depends=('lib32-libglvnd' 'lib32-alsa-lib' )
source=("ftl_advanced_edition_${pkgver//./_}.sh::gogdownloader://1207659102/en3installer0"
        "ftl.desktop")
sha256sums=('aac8bdcbbf47b823f77889e27be77d52dfde041c4977ec375176a2a52063e0c9'
            '34d225685c9b06ba2f70a08ab5f341a271c1b98c8ff7e3b593432a45c79b8dec')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

prepare(){
	sed -i 's/^here=.*$/here=\/opt\/gog-ftl\ncd "$here"/' "${srcdir}/data/noarch/game/data/FTL"
	sed -i 's/^command=.*$/command=FTL/'                  "${srcdir}/data/noarch/game/data/FTL"
}

package(){
	# Install game
	mkdir -p "${pkgdir}/opt/$pkgname"
	mv "${srcdir}/data/noarch/game/data" -T "${pkgdir}/opt/$pkgname"
	chmod -R 644 "${pkgdir}/opt/$pkgname/"
	chmod    755 "${pkgdir}/opt/$pkgname" "${pkgdir}/opt/$pkgname/FTL" "${pkgdir}/opt/$pkgname/FTL.amd64" "${pkgdir}/opt/$pkgname/FTL.x86"

	# Desktop integration
	install -Dm 644 "${pkgdir}/opt/$pkgname/exe_icon.bmp" \
		"${pkgdir}/usr/share/pixmaps/${pkgname}.png"
	install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm 644 "${srcdir}/ftl.desktop" \
		"${pkgdir}/usr/share/applications/ftl.desktop"
		install -dm 755 "${pkgdir}/usr/bin/"
	mv "${pkgdir}/opt/${pkgname}/FTL" "${pkgdir}/usr/bin/ftl"
}
