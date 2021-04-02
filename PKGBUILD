# Maintainer: 4censord <mail@business-insulting.de>

pkgname=gog-hacknet
pkgver=5.069
pkgrel=3
pkgdesc="Story driven Hacking Game (GOG version)"
url="https://www.gog.com/game/hacknet"
license=('custom')
arch=('x86_64' 'x86')
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
	sed -i 's/LD_PRELOAD="lib\/libcef.so/LD_PRELOAD="\/opt\/gog-hacknet\/lib\/libcef.so/gm' \
			"${srcdir}/data/noarch/game/Hacknet"
	sed -i 's/LD_PRELOAD="lib64\/libcef.so/LD_PRELOAD="\/opt\/gog-hacknet\/lib64\/libcef.so/gm' \
			"${srcdir}/data/noarch/game/Hacknet"
}

package(){
	# Install game
	mkdir -p "${pkgdir}/opt/$pkgname"
	cp -a "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
	chmod -R 644 "${pkgdir}/opt/$pkgname/"
	# required to be writable for creating new accounts, if not it fails with a exeption
	# doesnt seem to be actually written to.
	chmod -R 666 "${pkgdir}/opt/$pkgname/Content/People"

	find ${pkgdir} -type d -exec chmod +x {} +
	chmod 555 "${pkgdir}/opt/$pkgname/Hacknet.bin.x86_64"
	chmod 555 "${pkgdir}/opt/$pkgname/Hacknet.bin.x86"


	# remove mac files
	rm -rf "${pkgdir}/opt/gog-hacknet/Hacknet.app/"
	rm     "${pkgdir}/opt/gog-hacknet/OSX.README"


	# remove the respective other libary folder depending on the architecture
	[ $CARCH  == x86 ] && rm -rf "${pkgdir}/opt/gog-hacknet/lib64/"
	[ $CARCH  == x86_64 ] && rm -rf "${pkgdir}/opt/gog-hacknet/lib/"

	# remove the respective other executable depending on the architecture
	[ $CARCH  == x86 ] && rm -rf "${pkgdir}/opt/gog-hacknet/Hacknet.bin.x86_64"
	[ $CARCH  == x86_64 ] && rm -rf "${pkgdir}/opt/gog-hacknet/Hacknet.bin.x86"


	# remove integrated libsdl2 and libsdl2-image because it doesnt launch for me using them.
	# deleting them makes the dynamic linker use the system libs
	[ $CARCH  == x86 ] 	  && rm "${pkgdir}/opt/gog-hacknet/lib/libSDL2-2.0.so.0"
	[ $CARCH  == x86 ] 	  && rm "${pkgdir}/opt/gog-hacknet/lib/libSDL2_image-2.0.so.0"
	[ $CARCH  == x86_64 ] && rm "${pkgdir}/opt/gog-hacknet/lib64/libSDL2-2.0.so.0"
	[ $CARCH  == x86_64 ] && rm "${pkgdir}/opt/gog-hacknet/lib64/libSDL2_image-2.0.so.0"


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
