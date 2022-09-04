# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
_pkgname=dhewm3
pkgname=$_pkgname-git
pkgver=1.5.2.r1.gcc0f49f
pkgrel=1
epoch=1
pkgdesc="Doom 3 source port"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://dhewm3.org/"
license=('GPL3')
depends=('hicolor-icon-theme' 'sdl2')
makedepends=('cmake' 'curl' 'git' 'libbacktrace' 'openal')
optdepends=('doom3-data: for game data')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dhewm/dhewm3.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	sed -i '/FLAGS_RELEASE/s/-O2//' $_pkgname/neo/CMakeLists.txt
}

build() {
	cmake -S $_pkgname/neo -B build \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_INIT=-DLINUX_DEFAULT_PATH='\"/usr/share/games/doom3\"' \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDEDICATED=ON \
		-DREPRODUCIBLE_BUILD=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libbacktrace.so' 'libcurl.so' 'libopenal.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr $_pkgname/dist/linux/share
}
