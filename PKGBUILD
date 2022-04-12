# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andy Mender <andymenderunix@gmail.com>

pkgname=oaml
pkgver=1.3.4
pkgrel=3
pkgdesc="Library for implementing adaptive music in games"
arch=('x86_64')
url="https://oamldev.github.io/"
license=( 'MIT')
depends=('libsoxr' 'libvorbis')
optdepends=('alsa-lib: realtime audio support via ALSA'
            'libpulse: realtime audio support via PulseAudio'
            'jack: realtime audio support via JACK')
makedepends=('cmake' 'boost')
provides=('liboaml.so=1-64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oamldev/oaml/archive/v$pkgver.tar.gz")
sha256sums=('4000dabf043938bcff3069ead1052fb06a77a7004bda67adcc5bc9538d32908f')

build() {
	# support for audio libraries listed in 'depends' and 'optdepends' is ON by default
	# we don't want static libraries
	# TODO: add support for Unity engine?
	cmake \
		-S "$pkgname-$pkgver" \
		-B build \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_STATIC=OFF \
		-DENABLE_UNITYPLUGIN=OFF
	cmake --build build
}

package() {
	make DESTDIR="${pkgdir}" -C build install

	# install README and LICENSE
	cd "$pkgname-$pkgver"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
