# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=dhewm3
pkgname=$_pkgname-git
pkgver=1.5.1.r70.g61a49a2
pkgrel=1
epoch=1
pkgdesc="Doom 3 source port"
arch=('i686' 'x86_64')
url="https://dhewm3.org/"
license=('GPL3')
depends=('openal' 'sdl2')
makedepends=('cmake' 'curl' 'git' 'libbacktrace')
optdepends=('doom3-data: for game data and icon')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+https://github.com/dhewm/dhewm3.git"
	"$_pkgname.desktop"
)
md5sums=(
	'SKIP'
	'cd3a45168aa702fea871caea05da95b9'
)

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname/neo -B build \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_CXX_FLAGS_INIT=-DLINUX_DEFAULT_PATH='\"/usr/share/games/doom3\"' \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DDEDICATED=ON \
		-DREPRODUCIBLE_BUILD=ON \
		-Wno-dev
	cmake --build build
}

package() {
	depends+=('libbacktrace.so' 'libcurl.so')
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/applications $_pkgname.desktop
}
