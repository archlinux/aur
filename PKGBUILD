# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib-compiled
_pkgname='cpp-httplib'
pkgver=0.7.0
pkgrel=1
pkgdesc='A C++ HTTP/HTTPS server and client library (compiled version)'
arch=('x86_64' 'i686')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
provides=("cpp-httplib=$pkgver")
conflicts=('cpp-httplib')
depends=('openssl>=1.1.1' 'zlib')
makedepends=('cmake>=3.12')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('4ffbeb6672dec5f3704d6c3da09acf0e1984b5c7c68455f7fb030a7457bc64983665498015f2372d8a85da02be1750bab03dae956653297ac8efef67ff682854')
build() {
	mkdir -p "$srcdir/$_pkgname-$pkgver/build"
	cd "$srcdir/$_pkgname-$pkgver/build"
	# Install under /usr/lib instead of /usr/lib64
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=ON \
		-DHTTPLIB_REQUIRE_OPENSSL=ON \
		-DHTTPLIB_REQUIRE_ZLIB=ON \
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
