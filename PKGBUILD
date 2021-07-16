# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.9.1
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=1.1.1: HTTPS support' 'zlib: compression support' 'brotli: Brotli decompression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('164812075ad516a0a0ad587d7a479e0272fc5eecdbbf4522532dc3039a5282cc120b5b7d75eea3764d21acf203dc1bfccfb9e4f1dfe2515ca4ced546735c28fc')
build() {
	cd "$srcdir/$pkgname-$pkgver"
	# Quiets the "no git tag" warning
	sed -i "78d" "CMakeLists.txt"
	# Lets us force a full version string to be defined instead of just a major.minor
	sed -i "86s/^/set\(_httplib_version ${pkgver}\)/" "CMakeLists.txt"
	mkdir -p "build"
	cd "build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
	cmake --build .
}
package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake --build . --target install DESTDIR="$pkgdir"
	install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 '../README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
