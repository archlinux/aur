# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=fmt
pkgname=${_pkgname}9
pkgver=9.1.0
pkgrel=5
pkgdesc="Open-source formatting library for C++"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://fmt.dev/"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=('libfmt.so')
source=("$_pkgname::git+https://github.com/fmtlib/fmt.git#tag=$pkgver")
b2sums=('5a26a3545833033833302b1ad2a6fb2c0b53c5fe95114faa254affabf226dadb1cb319f05f1ceb1cdb100706045fbc11e3c162f95df517173af424b4e2c03965')

prepare() {
	cd $_pkgname
	# hip workaround
	git cherry-pick -n 0b0f7cfbfcebd021c910078003d413354bd843e2
	# https://github.com/fmtlib/fmt/pull/3563
	git cherry-pick -n eacd51c249bd9e2eb714969331dae3c0c5535523
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DFMT_CMAKE_DIR=lib/cmake/$pkgname \
		-DFMT_DOC=OFF \
		-DFMT_INC_DIR=include/$pkgname \
		-DFMT_PKGCONFIG_DIR=lib/$pkgname/pkgconfig \
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
	cd "$pkgdir"
	ln -sf ../libfmt.so.9 usr/lib/$pkgname/libfmt.so
	rm usr/lib/libfmt.so
	sed -i "/libdir/s/\/lib/&\/$pkgname/" usr/lib/$pkgname/pkgconfig/*.pc
}
