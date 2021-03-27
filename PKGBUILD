# Maintainer: Lukas1818 <aur at lukas1818 dot de>

pkgname=gog-hacknet
pkgver=5.069
pkgrel=1
pkgdesc="Story driven Hacking Game"
url="https://www.gog.com/game/hacknet"
license=('custom')
arch=('i686' 'x86_64')
makedepends=('sed')
provides=("hacknet=$pkgver")
depends=('sdl2' 'sdl2_image' 'gconf')
source=("local://hacknet_en_5_069_15083.sh"
		"gog-hacknet.desktop")
sha256sums=('b906aa80f8ff526cd6388a54a8de84cf735d9f65760e38996e1bab1cc4b333bd'
            'dc93dbff6d7c254b07247dcacc4348da6e52590c6b48968c60b48b72e03290b2')

prepare(){
	# change the path in the start script from ./ to /opt/gog-hacknet/ 
	sed -i 's/\.\/Hacknet\.bin\.x86_64/\/opt\/gog-hacknet\/Hacknet.bin.x86_64/gm' \
			"${srcdir}/data/noarch/game/Hacknet"
	sed -i 's/\.\/Hacknet\.bin\.x86 /\/opt\/gog-hacknet\/Hacknet.bin.x86 /gm' \
			"${srcdir}/data/noarch/game/Hacknet"
}

package(){
	# Install game
	mkdir -p "${pkgdir}/opt/$pkgname"
	cp -a "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
	chmod -R 644 "${pkgdir}/opt/$pkgname/"
	find ${pkgdir} -type d -exec chmod +x {} +
	chmod 555 "${pkgdir}/opt/$pkgname/Hacknet.bin.x86_64"
	chmod 555 "${pkgdir}/opt/$pkgname/Hacknet.bin.x86"

	# remove integrated libsdl2 and libsdl2-image because it doesnt launch for me using them.
	# deleting them makes the dynamic linker use the system libs
	rm "${pkgdir}/opt/gog-hacknet/lib64/libSDL2-2.0.so.0"
	rm "${pkgdir}/opt/gog-hacknet/lib64/libSDL2_image-2.0.so.0"
	rm "${pkgdir}/opt/gog-hacknet/lib/libSDL2-2.0.so.0"
	rm "${pkgdir}/opt/gog-hacknet/lib/libSDL2_image-2.0.so.0"

	# Desktop integration
	install -Dm 644 "${srcdir}/data/noarch/support/icon.png" \
					"${pkgdir}/usr/share/pixmaps/${pkgname}.png"

	install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
					"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm 644 "${srcdir}/gog-hacknet.desktop" \
					"${pkgdir}/usr/share/applications/gog-hacknet.desktop"

	install -Dm 755 "${pkgdir}/opt/gog-hacknet/Hacknet" \
					"${pkgdir}/usr/bin/hacknet"

	install -Dm 444 "${srcdir}/data/noarch/docs/End User License Agreement.txt" \
					"${pkgdir}/usr/share/licenses/${pkgname}/EULA.txt"
}
