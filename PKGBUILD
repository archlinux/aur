# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=7.2
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://fabiangreffrath.github.io/crispy-homepage"
license=('GPL2')
depends=('fluidsynth' 'hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net')
makedepends=('python')
optdepends=('freedm: Free deathmatch game'
	'freedoom1: Free Ultimate Doom-compatible game'
	'freedoom2: Free Doom II-compatible game')
install=crispy-doom.install
source=(https://github.com/fabiangreffrath/$pkgname/archive/$pkgname-$pkgver.tar.gz)
b2sums=('9cf3dcdd8b3e3d90aea1a9f41b7d9a08a80cf8f358b3bb1d5b4a27f60df1cb62d7778c80df26ac9a25fd118eeefd3cfe89a4ce75482ea5a0a9852ed0bfd158de')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"

	for patch in ../*.patch; do
		if [ ! -f "$patch" ]; then
			break
		else
			patch -p1 -i "$patch"
		fi
	done
}

build() {
	cd "$pkgname-$pkgname-$pkgver"

	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	cd "$pkgdir"/usr
	rm bin/crispy-{heretic,hexen,strife}-setup
	mv bin/crispy-doom-setup bin/crispy-setup
	for game in doom heretic hexen strife; do
		ln -s crispy-setup bin/crispy-${game}-setup
	done
}
