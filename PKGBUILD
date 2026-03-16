# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Mike Swanson <mikeonthecomputer@gmail.com>
_pkgname=dhewm3
pkgname=$_pkgname-git
pkgver=1.5.5_RC2.r13.g098f77e
pkgrel=1
epoch=1
pkgdesc="Doom 3 source port"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://dhewm3.org/"
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'sdl2')
makedepends=('cmake' 'curl' 'git' 'libbacktrace' 'libgcc' 'libstdc++' 'openal')
optdepends=('doom3-data: for game data')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/dhewm/dhewm3.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

prepare() {
	cd $_pkgname
	# remove hardcoded optimization flags
	sed -Ei 's/-O([0123s]|fast)//' neo/CMakeLists.txt
}

build() {
	local options=(
		-B build
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_CXX_FLAGS_INIT=-DLINUX_DEFAULT_PATH='\"/usr/share/games/doom3\"'
		-D CMAKE_INSTALL_LIBDIR=lib
		-D CMAKE_INSTALL_PREFIX=/usr
		-D DEDICATED=ON
		-D REPRODUCIBLE_BUILD=ON
		-W no-dev
	)
	cmake "${options[@]}" $_pkgname/neo
	cmake --build build
}

package() {
	depends+=(
		'libbacktrace.so'
		'libcurl.so'
		'libgcc_s.so'
		'libopenal.so'
		'libstdc++.so'
	)

	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	cp -dr --no-preserve=ownership -t "$pkgdir"/usr $_pkgname/dist/linux/share
}
