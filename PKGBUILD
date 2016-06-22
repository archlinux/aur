# Maintainer: PureTryOut
pkgname=openrw-git
pkgver=r812.93f7a40
pkgrel=1
epoch=
pkgdesc="A re-implementation of Rockstar Games' Grand Theft Auto III"
arch=('x86_64')
url="https://github.com/rwengine/openrw"
license=('GPL3')
groups=()
depends=('bullet' 'glm' 'libmad' 'openal' 'libsndfile' 'sdl2')
makedepends=('git' 'cmake' 'make')
checkdepends=()
optdepends=()
provides=('openrw')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('openrw-git::git+https://github.com/rwengine/openrw.git'
	'openrw.desktop')
noextract=()
sha256sums=('SKIP'
	'78f96261cf22a5413f4e17480b9cb08ce4da8683fb2f8399018e80c96246d0b0')
validpgpkeys=()

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	
	if [[ -d build ]]; then
		rm -rf build
	fi
	mkdir build && cd build

	cmake -DCMAKE_BUILD_TYPE=Release ..
	make $MAKEFLAGS
}


package() {
	cd "$pkgname"

	# The application
	install -Dm755 build/rwgame/rwgame "$pkgdir/usr/bin/rwgame"

	# .desktop file and icon
	install -Dm644 "$srcdir/openrw.desktop" "$pkgdir"/usr/share/applications/openrw.desktop	
}
