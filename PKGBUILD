# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.7.1
pkgrel=2
pkgdesc='A C++ HTTP/HTTPS server and client library (compiled version)'
arch=('x86_64' 'i686')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
provides=("cpp-httplib=$pkgver")
conflicts=('cpp-httplib')
optdepends=('openssl>=1.1.1: HTTPS support' 'zlib: compression support')
makedepends=('cmake>=3.14' 'python>=3.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('634690ca0289026d2ea15075ee7b5691a28f0028a015ba5c19994c2680bad9ee955858f621032d2d6ef7d1a334c13a9f640b0a4c24bb5f8725a040c372bf2fb3')
build() {
	cd "$srcdir/$_pkgname-$pkgver"
	# Lets us force a full version string to be defined instead of just a major.minor
	sed -i "76s/^/set\(_httplib_version ${pkgver}\)/" "CMakeLists.txt"
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
