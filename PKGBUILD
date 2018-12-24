# Maintainer: Jesin <Jesin00@gmail.com>
# Contributor: Eduardo Sánchez Muñoz
pkgname=nlohmann-json-git
_name="${pkgname%-git}"
pkgver=3.5.0
pkgrel=1
pkgdesc='Header-only JSON library for Modern C++'
url='https://github.com/nlohmann/json'
license=(MIT)
arch=(x86_64)
makedepends=(cmake git)
provides=("$_name=${pkgver%%+*}")
conflicts=("$_name")
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd json
	local v="$(git describe --tags)"
	v="${v#v}"
	printf %s "${v//-/+}"
}

_cmake_flags=(
	-DCMAKE_BUILD_TYPE=Release
	-DCMAKE_INSTALL_PREFIX=/usr
)

build() {
	mkdir build
	cd build
	cmake ../json "${_cmake_flags[@]}" -DBUILD_TESTING=OFF
	make
}

check() {
	cd build
	cmake ../json "${_cmake_flags[@]}" -DBUILD_TESTING=ON
	make
	ctest --output-on-failure
}

package() {
	cd build
	make "DESTDIR=$pkgdir" install
	install -Dm644 "-t$pkgdir/usr/share/licenses/$_name" ../json/LICENSE.MIT
}
