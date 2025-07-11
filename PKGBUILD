#Maintainer: Okabe Zero-Link (okbzl). Email: okabezerolink@gmail.com

pkgname=system3-sdl2
pkgver=1.6.1
pkgrel=1
pkgdesc="SDL2 port of AliceSoft's System3 game engine."
arch=(x86_64)
url="https://github.com/kichikuou/system3-sdl2"
license=('GPL-2.0-only')
depends=(sdl2 sdl2_ttf sdl2_mixer rtmidi nlohmann-json)
makedepends=(cmake)
source=("${pkgname}-1.6.1-1-pkgconfig.patch::https://github.com/kichikuou/system3-sdl2/commit/8a88a5c06e5683e54591a03b08bdbe04a3a57cc2.patch"
	"${pkgname}-1.6.1-2-pkgconfig.patch::https://github.com/kichikuou/system3-sdl2/commit/aef2822bc476470629147716d04c64bb1ef3868b.patch")
sha256sums=('28955be430a4ae1a7b86b9ceeee9e6fd43a2d9498632290d203b6ff29d0272b7'
	    'e199b63b8e6174824db82b0bdb8a5ac78cd076a095de663832b3c5543fd2a283')
prepare () {
	git clone --depth 1 --branch v${pkgver} ${url}.git
	cd ${pkgname}
	git submodule update --init
	
	# patch
	patch -Np1 -i ../"${pkgname}-1.6.1-1-pkgconfig.patch"
	patch -Np1 -i ../"${pkgname}-1.6.1-2-pkgconfig.patch"
}

build() {
	cd "$srcdir/${pkgname}"
	mkdir -p out/debug
	cd out/debug
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ../../
	make
}

package() {
  cd "$srcdir/${pkgname}/out/debug"
  make DESTDIR="${pkgdir}" install
}
