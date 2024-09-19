# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sdl2_sound
pkgver=2.0.2
pkgrel=1
pkgdesc="An abstract soundfile decoder"
arch=('i686' 'x86_64')
url="https://icculus.org/SDL_sound/"
license=('zlib')
depends=('sdl2')
makedepends=('cmake' 'ninja')
source=("https://github.com/icculus/SDL_sound/releases/download/v${pkgver}/SDL2_sound-${pkgver}.tar.gz"{,.sig})
sha256sums=('465a81d6004af731768b881b2f50383150cc58a8d346653bad85e2375829cc3a'
            'SKIP')
validpgpkeys=('50F91FB550EC32AB4A710286FA148B892AB48044')

_srcdir="SDL2_sound-${pkgver}"

build() {
	cmake -S "${_srcdir}" -Bbuild -GNinja \
		-DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr \
		-DSDLSOUND_DECODER_MIDI=TRUE -DSDLSOUND_BUILD_STATIC=FALSE
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	# handle conflict with sdl_sound
	mv "$pkgdir"/usr/bin/playsound{,-sdl2}

	cd ${_srcdir}

	# docs
	install -Dm644 -t "$pkgdir"/usr/share/doc/${pkgname} docs/*

	# license
	install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgname} LICENSE.txt
}
