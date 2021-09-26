# Maintainer: Jayvee Enaguas <harvettfox96@dismail.de>

pkgname=transcend
pkgver=0.3
pkgrel=1
_debver=0.3
_dfsgrel=dfsg2
_debrel=3
pkgdesc="retro-style, abstract 2D shooter"
arch=('x86_64' 'i686')
url="http://transcend.sourceforge.net/"
license=('GPL-2')
depends=('freeglut' 'glu' 'portaudio' 'mesa-libgl')
makedepends=('graphicsmagick' 'quilt')
groups=('games')
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.sourceforge.net/${pkgname}/${pkgname^}_${pkgver}_UnixSource.tar.gz"
	"https://deb.debian.org/debian/pool/main/t/${pkgname}/${pkgname}_${_debver}.${_dfsgrel}-${_debrel}.debian.tar.gz"
	"app-transcend-128px.png")
sha512sums=('5a2d21256c202ee045f8e2c926705f79885f6efbb5f44d3129e5b05cb1e28f909a32a5d873a9673d5fa48cbe4e79766c44947f147089e988e2fa3f83cde1b91d'
	    '572c411d3c1f83f14f67e31201846d4b9bec3561f166cf03e327c730e557ce66f3b84ea20a2ed3e731b0d688209ba3ce6ee1a0846a23f5607001be9364dcba20'
	    '1f94578424efaa06e4121674ee75103de56507402b31fc51a7a9784fd380ca320404029b27ad976c1019f38b4c08b2557627a457fd1663b32542e20009f2f00e')

prepare() {
	mv -v ${pkgname^}_${pkgver}_UnixSource ${pkgname}-${pkgver} && cd ${pkgname}-${pkgver}

	if [[ ${pkgver%.*} = ${_debver%.*} ]]; then
		# Debian patches
		export QUILT_PATCHES=debian/patches
		export QUILT_REFRESH_ARGS="-p ab --no-timestamps --no-index"
		export QUILT_DIFF_ARGS="--no-timestamps"

		cp -rv ${srcdir}/debian .

		quilt push -av
	fi

	# Remove non-free and unused directories and files.
	rm -frv ${pkgname^}/portaudio
	rm -frv minorGems/util/development/fortify
	rm -v minorGems/graphics/openGL/{texture,tga}.*
	# Increase window size to 640x480 from the original.
	sed -i 's#300, 300#640, 480#' ${pkgname^}/game/game.cpp
	# Resize icon size to 32px square and convert to XPM.
	gm convert -verbose -scale 32x32 ../app-${pkgname}-{128,32}px.png
	gm convert -verbose ../app-${pkgname}-32px.{png,xpm}
	# Generate a make file preparing to build.
	cd ${pkgname^} && platformSelection=1 ./configure
}

build() {
	cd ${pkgname}-${pkgver}

	make OPTIMIZE_FLAG="$(CPPFLAGS) $(CXXFLAGS) -DLEVELS_DIR=\\\"/usr/share/games/${pkgname}/levels\\\"" PLATFORM_LINK_FLAGS="$(LDFLAGS) -lGL -lGLU -lglut -lportaudio -lpthread" VERBOSE=1 -C ${pkgname^}/game
	# Compress manual file into gzip.
	gzip -v9 debian/${pkgname^}.6
}

package() {
	cd ${pkgname}-${pkgver}

	# Install levels directory.
	install -dv ${pkgdir}/usr/share/games/${pkgname} && cp -rv ${pkgname^}/levels ${pkgdir}/usr/share/games/${pkgname}
	# Install binary, app shortcut and icon, manual, and licence files.
	install -Dvm755 ${pkgname^}/game/${pkgname^} ${pkgdir}/usr/games/${pkgname}
	ln -fs ${pkgdir}/usr/games/{${pkgname},${pkgname^}}
	install -Dvm644 debian/${pkgname}.desktop -t ${pkgdir}/usr/share/applications
	install -Dvm644 debian/menu ${pkgdir}/usr/share/menu/${pkgname}
	for res in {32,128}; do
		install -Dvm644 ../app-${pkgname}-${res}px.png ${pkgdir}/usr/share/icons/hicolor/${res}x${res}/apps/${pkgname}.png
	done
	for ext in {png,xpm}; do
		install -Dvm644 ../app-${pkgname}-32px.${ext} ${pkgdir}/usr/share/pixmaps/${pkgname}.${ext}
	done
	install -Dvm644 debian/${pkgname^}.6.gz ${pkgdir}/usr/share/man/man6/${pkgname}.6.gz
	ln -fs ${pkgdir}/usr/share/man/man6/{${pkgname},${pkgname^}}.6.gz
	install -Dvm644 debian/copyright ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
