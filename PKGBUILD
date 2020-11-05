# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.7.12
pkgrel=1
pkgdesc='A C++ HTTP/HTTPS server and client library (compiled version)'
arch=('x86_64' 'i686')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
provides=("cpp-httplib=$pkgver")
conflicts=('cpp-httplib')
optdepends=('openssl>=1.1.1: HTTPS support' 'zlib: compression support' 'brotli: Brotli decompression support')
makedepends=('cmake>=3.14' 'python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('d2b1b553bffb65ec8b8a3d8cbcb8dc0a823dac8a0f215fc8f3a5ed242c3d4d85ea6cf1738833b230d04bf1f3fb3ca994f464faa7c6321a253ab13a01bcaed849')
build() {
	cd "$srcdir/$_pkgname-$pkgver"
	# Lets us force a full version string to be defined instead of just a major.minor
	sed -i "87s/^/set\(_httplib_version ${pkgver}\)/" "CMakeLists.txt"
	mkdir -p "build"
	cd "build"
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=ON \
		-DHTTPLIB_COMPILE=ON \
		-DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
package() {
	cd "$srcdir/$_pkgname-$pkgver/build"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cmake --build . --target install DESTDIR="$pkgdir"
	install -Dm644 '../README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
