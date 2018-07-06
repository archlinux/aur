#Maintainer: David A. Redick <david.a.redick@gmail.com>
#Contributor: Frederic Bezies <fredbezies at gmail dot com>
#Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=tecnoballz
pkgver=0.93.1
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc='An exciting brick breaker game'
url='http://linux.tlk.fr/games/TecnoballZ/'
depends=('sdl_image' 'sdl_mixer' 'tinyxml' 'libmikmod')
license=('GPL3')
backup=('var/lib/tecnoballz/tecnoballz.hi')
source=(
	"http://linux.tlk.fr/games/TecnoballZ/download/${pkgname}-${pkgver}.tgz"
	"${pkgname}.xpm"
	"${pkgname}.desktop"
	games.dir.patch
)

md5sums=(
	'7beeacb06fa841382f0ecbe73f64723a'
	'5b8d94612523353b6d2eb32f840b58d8'
	'eec9a3f78b51647b41c3e4c6d1d19ce9'
	'92793da20387db8c32646052a85e56d7'
)

prepare () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/games.dir.patch"
}

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# The original submitter used this but the project docs say to use bootstrap
	#autoreconf -fvi
	./bootstrap

    	./configure --prefix=/usr

	# Works out of the box for me but the original submitter did this.
	## -O3 breaks compilation!
	#sed -i 's/CXXFLAGS=" -O3 -Wall"/CXXFLAGS=" -O2 -Wall"/' configure

	make 
}

package () {
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	install -m644 tecnoballz.desktop "${pkgdir}/usr/share/applications"
	install -m644 tecnoballz.xpm "${pkgdir}/usr/share/pixmaps"

	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir" install

	# fix permissions
	chgrp users "${pkgdir}/var/lib/${pkgname}/tecnoballz.hi"
	chmod 755 "${pkgdir}/usr/bin/${pkgname}"
}
