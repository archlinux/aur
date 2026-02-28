# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isho Antar <IshoAntar@protonmail.com>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>
_pkgname=fmt
pkgname=$_pkgname-git
pkgver=12.1.0.r109.g88c5a91
pkgrel=1
pkgdesc="Open-source formatting library for C++"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://fmt.dev/"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'git' 'libgcc' 'libstdc++')
provides=("$_pkgname=$pkgver" 'libfmt.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/fmtlib/fmt.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags --abbrev=7 | sed 's/[^-]*-g/r&/;s/-/./g'
}

build() {
	local options=(
		-B build
		-D BUILD_SHARED_LIBS=ON
		-D CMAKE_BUILD_TYPE=Release
		-D CMAKE_CXX_FLAGS_RELEASE="-DNDEBUG"
		-D CMAKE_INSTALL_PREFIX=/usr
		-D FMT_DOC=OFF
		-D FMT_TEST="$CHECKFUNC"
		-W no-dev
	)
	cmake "${options[@]}" $_pkgname
	cmake --build build
}

check() {
	ctest --output-on-failure --test-dir build
}

package() {
	depends+=('libgcc_s.so' 'libstdc++.so')

	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
