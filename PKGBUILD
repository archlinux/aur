# Maintainer: Abdur-Rahman Mansoor <armansoor at missingno dot dev>

pkgname='libpkedit'
pkgver=0.5.4
pkgrel=1
url="https://codeberg.org/ramenu/pkedit"
pkgdesc='A cross-platform library for modifying Pokémon save files'
arch=('x86_64' 'i686' 'aarch64')
makedepends=('cmake' 'msgpack-cxx')
depends=('glibc' 'libstdc++' 'zlib' 'libgcc' 'libarchive')
checkdepends=('nlohmann-json' 'gtest')
license=('LGPL-3.0-only')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
conflicts=("$pkgname")
provides=("$pkgname")
b2sums=('eb2b7afcd6a5e87302007f608465e922427971824cb7fe974ed0e2f1157dff2532d6d9862d72cba35c36daab11f8d7c87a72b5dd8b9948a60a4d1c57e51ed243')

build() {
	cd "$srcdir/pkedit"
	local cmake_options=(
	    -B build
	    -G 'Unix Makefiles'
	    -W no-dev
	    -D CMAKE_BUILD_TYPE=Release
	    -D CMAKE_INSTALL_PREFIX=/usr
	    -D CMAKE_CXX_STANDARD=20
	  )
	  cmake "${cmake_options[@]}"
	  cmake --build build -t all
}

check() {
	cd "$srcdir/pkedit/build"
	ctest
}

package() {
	cd "$srcdir/pkedit"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}

