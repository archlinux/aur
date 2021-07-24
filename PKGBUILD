# Maintainer: sum01 <sum01@protonmail.com>
pkgname=cpp-httplib
pkgver=0.9.2
pkgrel=1
pkgdesc='A C++ header-only HTTP/HTTPS server and client library'
arch=('any')
url='https://github.com/yhirose/cpp-httplib'
license=('MIT')
makedepends=('cmake>=3.14')
optdepends=('openssl>=1.1.1: HTTPS support' 'zlib: compression support' 'brotli: Brotli decompression support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/yhirose/cpp-httplib/archive/v$pkgver.tar.gz")
sha512sums=('3430e3d311c81c4841c176a7c8e8ba0d1546b30e0affbfe350844bfc6128e88e9dbd0dd1e7c59cc00b5e98f82b1cbd6abaa051c6400777fa447c7ca929f41183')
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
