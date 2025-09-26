# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

_pkgname='libpkedit'
pkgname="$_pkgname-git"
pkgver=v0.0.1.r5.gb288666
pkgrel=1
url="https://codeberg.org/ramenu/pkedit"
pkgdesc='A cross-platform library for modifying Pokémon save files'
arch=('x86_64' 'i686' 'aarch64')
makedepends=(
	'cmake' 
	'pybind11' 
	'msgpack-cxx'
	'make'
	'gtest'
)
depends=(
	'glibc'
	'zlib'
	'libarchive'
)
optdepends=('python')
license=('LGPL-3.0-only')
source=("$_pkgname::git+$url")
conflicts=("$_pkgname")
provides=("$_pkgname")
b2sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	local cmake_options=(
	    -B build
	    -S "$_pkgname"
	    -G 'Unix Makefiles'
	    -W no-dev
	    -D CMAKE_BUILD_TYPE=Release
	    -D CMAKE_INSTALL_PREFIX=/usr
	  )
	  cmake "${cmake_options[@]}"
	  cmake --build build -t pkedit
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -Dm644 "$_pkgname/README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
}

