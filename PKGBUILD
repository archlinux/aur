# Maintainer: Alexandre Bouvier <contact@amb.tf>
_pkgname=cpp-httplib
pkgname=$_pkgname-git
pkgver=0.12.1.r2.g88a9278
pkgrel=1
pkgdesc="A C++ HTTP/HTTPS server and client library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/yhirose/cpp-httplib"
license=('MIT')
depends=('gcc-libs' 'glibc' 'zlib')
makedepends=('brotli' 'cmake' 'git' 'openssl>=1.1.1' 'python')
checkdepends=('gtest')
provides=("$_pkgname=$pkgver" 'libhttplib.so')
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cmake -S $_pkgname -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DHTTPLIB_COMPILE=ON \
		-DHTTPLIB_TEST="$CHECKFUNC" \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build
}

package() {
	depends+=(
		'libbrotlidec.so'
		'libbrotlienc.so'
		'libcrypto.so'
		'libssl.so'
	)
	# shellcheck disable=SC2154
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname $_pkgname/LICENSE
}
