# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sdl2_sound
pkgver=2.0.4
pkgrel=1
pkgdesc="An abstract soundfile decoder"
arch=('i686' 'x86_64')
url="https://icculus.org/SDL_sound/"
license=('Zlib')
depends=('sdl2')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/icculus/SDL_sound/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6f8b324ce23382929ab90ded7fcd6e303b66cb22b4e15b4e3c3a99f500a4eec1')

_srcdir="SDL_sound-${pkgver}"

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
