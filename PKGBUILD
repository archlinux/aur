# Maintainer: Alexandre Bouvier <contact@amb.tf>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Isho Antar <IshoAntar@protonmail.com>
# Contributor: Michael Yang <ohmyarchlinux@pm.me>
_pkgname=fmt
pkgname=$_pkgname-git
pkgver=10.1.1.r40.g7529af8f
pkgrel=1
pkgdesc="Open-source formatting library for C++"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://fmt.dev/"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname=$pkgver" 'libfmt.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/fmtlib/fmt.git")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DFMT_DOC=OFF \
		-DFMT_TEST="$CHECKFUNC" \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
