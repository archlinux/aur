# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>
pkgname=shockolate-git
pkgver=v0.6.0.r743.ae36cec2
pkgrel=1
pkgdesc="Source port of the original System Shock"
arch=(x86_64)
url="https://github.com/Interrupt/systemshock"
license=('GPL')
groups=()
depends=(sdl2 sdl2_mixer fluidsynth)
makedepends=(git cmake)
source=('git+https://github.com/Interrupt/systemshock.git')
noextract=()
md5sums=('SKIP')

_gitname="systemshock"

pkgver() {
	cd "$srcdir/$_gitname"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$_gitname"

	cmake -B build -S "$srcdir/$_gitname" \
		-DCMAKE_RELEASE_TYPE=None \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DENABLE_SDL2=ON \
		-DENABLE_FLUIDSYNTH=ON \
		-DENABLE_SOUND=ON \
		-Wno-dev \
		-G Ninja

	ninja -C build
}

package() {
	# This CMakeLists somehow does not include install info; do it ourselves.
	# (It's only a single file, thankfully!)
	mkdir -p "$pkgdir"/usr/bin
	
	# also, rename binary to 'shockolate'
	cp "$srcdir/$_gitname/build/systemshock" "$pkgdir"/usr/bin/shockolate
}
