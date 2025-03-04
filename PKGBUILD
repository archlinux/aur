# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=teakra
pkgname=$_pkgname-git
pkgver=r344.4dfebf8
pkgrel=1
pkgdesc="DSi/3DS DSP emulator, disassembler, assembler and tester"
arch=('x86_64')
url="https://github.com/wwylele/teakra"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=${pkgver#r}" "libteakra.so" "libteakra_c.so")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	local options=(
		-D BUILD_SHARED_LIBS=ON
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D TEAKRA_BUILD_TOOLS=OFF
		-D TEAKRA_BUILD_UNIT_TESTS="$CHECKFUNC"
		-Wno-dev
	)
	cmake "${options[@]}" -B build -S $_pkgname
	cmake --build build
}

check() {
	ctest --output-on-failure --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
