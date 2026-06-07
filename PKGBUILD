# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sdl2_sound
pkgver=2.0.6
pkgrel=1
pkgdesc='An abstract soundfile decoder'
arch=('i686' 'x86_64')
url='https://icculus.org/SDL_sound/'
license=('Zlib')
depends=('sdl2')
makedepends=('cmake' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/icculus/SDL_sound/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('63be57cc80bcd29aeed6c29700759871c44c90251a7508b8d0eacd8d9cece30c')

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

	cd "${_srcdir}"

	# docs
	install -Dm644 -t "$pkgdir"/usr/share/doc/${pkgname} docs/*

	# license
	install -Dm644 -t "$pkgdir"/usr/share/licenses/${pkgname} LICENSE.txt
}
