# Maintainer: jlaunay
_pkgname=hyprlang
pkgname="${_pkgname}-git"
pkgver=0.2.1.r6.d486806
pkgrel=1
pkgdesc="hyprlang - the hypr configuration language"
arch=('x86_64')
url="https://github.com/hyprwm/hyprlang"
license=("GPL")
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cmake')
provides=(
	"$_pkgname=${pkgver%%.r*}"
	"lib$_pkgname.so"
	)
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	local _cmake_options=(
		-B build
		-S ${pkgname/-git/}
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_INSTALL_PREFIX=/usr
		--no-warn-unused-cli
	)
	cmake "${_cmake_options[@]}"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
