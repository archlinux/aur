# Maintainer: MGislv <mgislv at ceppo dot xyz>
# Contributor: Keon Cachia <keonfarrugia at gmail dot com>
pkgname=crispy-doom-git
pkgdesc='Limit-removing enhanced-resolution Doom source port based on Chocolate Doom'
pkgver=7.1.r32.gbfd3e930
pkgrel=2
arch=('x86_64_v3' 'x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/fabiangreffrath/crispy-doom'
license=('GPL2')
depends=('hicolor-icon-theme' 'libpng' 'libsamplerate' 'sdl2_mixer' 'sdl2_net' 'fluidsynth')
makedepends=('python' 'git')
optdepends=('freedm: Free deathmatch game'
            'freedoom: Free Doom compatible game')
provides=('crispy-doom')
conflicts=('crispy-doom')
install=crispy-doom.install
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd crispy-doom
	git describe --long --tags --match crispy-doom-* | sed 's/^crispy-doom-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd crispy-doom
	autoreconf -fi
	./configure --prefix=/usr CC="$CC" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"
	make
}

package() {
	make DESTDIR="$pkgdir" -C crispy-doom install
	cd "$pkgdir"/usr
	rm bin/crispy-{heretic,hexen,strife}-setup
	mv bin/crispy-doom-setup bin/crispy-setup
	for game in doom heretic hexen strife; do
		ln -s crispy-setup bin/crispy-${game}-setup
	done
}
