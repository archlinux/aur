# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.7.6
pkgrel=1
pkgdesc='A C++ HTTP/HTTPS server and client library (compiled version)'
arch=('x86_64' 'i686')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
provides=("cpp-httplib=$pkgver")
conflicts=('cpp-httplib')
optdepends=('openssl>=1.1.1: HTTPS support' 'zlib: compression support' 'brotli: Brotli decompression support')
makedepends=('cmake>=3.14' 'python>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('b9d4f89e88b83590b151012fa4431a812930c6906d45f6d205dd8b053e295e79a3003af391a4eb8dea9922557b2599ebd9a91b4e3d5a72b29c70121f73ffb965')
build() {
	cd "$srcdir/$_pkgname-$pkgver"
	# Lets us force a full version string to be defined instead of just a major.minor
	sed -i "87s/^/set\(_httplib_version ${pkgver}\)/" "CMakeLists.txt"
	mkdir -p "build"
	cd "build"
	# Install under /usr/lib instead of /usr/lib64
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
