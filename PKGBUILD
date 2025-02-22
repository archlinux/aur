# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>
pkgname=shockplus-git
pkgver=r1781.a47264f
pkgrel=1
pkgdesc="System Shock sourceport with extra features, based on Shockolate"
arch=(x86_64)
url="https://github.com/winterheart/ShockPlus"
license=('GPL')
groups=()
depends=(sdl2 sdl2_mixer fluidsynth)
makedepends=(git cmake)
source=('shockplus::git+https://github.com/winterheart/ShockPlus.git')
noextract=()
md5sums=('SKIP')

_gitname="shockplus"

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
	
	cp "$srcdir/$_gitname/build/shockplus" "$pkgdir"/usr/bin/shockplus
}
