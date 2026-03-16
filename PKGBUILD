# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=crispy-doom
pkgdesc="Vanilla-compatible enhanced Doom engine"
pkgver=7.1
pkgrel=2
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
b2sums=('9e3250e5f7e39c175d980bc03f02d7a5edbff2c53e0526dd88434dc5e954246c3fc1280336842e910b3641da325f1df5f805b7d25ba44a8aa245f668ac0e8bb9')

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
