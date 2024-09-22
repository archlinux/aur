# Maintainer: Dennis Herbrich (Gyroplast) <dennis.herbrich@veloxis.de>
# Contributor: Brandon Mulcahy <brandon@jangler.info>
pkgname=schismtracker-git
pkgver=r2438.55398fa
pkgrel=4
pkgdesc='A reimplementation of the Impulse Tracker music editor.'
arch=('i686' 'x86_64' 'armv7h')  # and likely many more
url='https://schismtracker.org/'
license=('GPL-2.0-only')
depends=('libutf8proc' 'sdl2' 'hicolor-icon-theme')
optdepends=(
  'alsa-lib: ALSA MIDI support'
  'jack: JACK output support'
  'flac: FLAC sample loading support'
)
makedepends=('git')
provides=("schismtracker=${pkgver}")
conflicts=('schismtracker')
source=("$pkgname::git+https://github.com/schismtracker/schismtracker.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir/" install
	install -Dm644 README.md \
		"$pkgdir/usr/share/doc/schismtracker/README.md"
}
