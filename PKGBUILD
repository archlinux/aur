# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=fmt
pkgname=${_pkgname}9
pkgver=9.1.0
pkgrel=2
pkgdesc="Open-source formatting library for C++"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://fmt.dev/"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=('libfmt.so')
source=("$_pkgname::git+https://github.com/fmtlib/fmt.git#tag=$pkgver")
b2sums=('SKIP')

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DFMT_CMAKE_DIR=lib/cmake/$pkgname \
		-DFMT_DOC=OFF \
		-DFMT_INC_DIR=include/$pkgname \
		-DFMT_LIB_DIR=lib/$pkgname \
		-DFMT_PKGCONFIG_DIR=/usr/lib/$pkgname/pkgconfig \
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
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE.rst
}
