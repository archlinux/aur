# Maintainer: sum01 <sum01@protonmail.com>
pkgname=sqlitecpp
_dirname='SQLiteCpp'
pkgver=3.1.1
pkgrel=1
pkgdesc='A smart and easy to use C++ SQLite3 wrapper.'
arch=('i686' 'x86_64')
url='https://github.com/SRombauts/SQLiteCpp'
license=('MIT')
# Real min. dep is 3.7.15.
# Using 3.19 so we don't need to handle legacy struct.
depends=('sqlite>=3.19')
optdepends=('sqlcipher: for database encryption API')
makedepends=('cmake>=3.1')
source=("$pkgname-$pkgver::https://github.com/SRombauts/SQLiteCpp/archive/${pkgver}.tar.gz")
sha512sums=('9030b5249c149db8a5b2fe350f71613e4ee91061765a771640ed3ffa7c24aada4000ba884ef91790fdc0f13dc4519038c1edeba64b85b85ac09c3e955a7988a1')
build() {
	_has_sqlcipher='false'

	# Check if the user has sqlcipher to enable optional support
	if ! [[ $(pacman -Qs sqlcipher) == '' ]]; then
		_has_sqlcipher='true'
	fi

	mkdir -p "$_dirname-$pkgver/build"
	cd "$_dirname-$pkgver/build"

	# Using -DSQLITECPP_INTERNAL_SQLITE=OFF tells it to use our system's sqlite
	# SQLITE_HAS_CODEC enables/disables DB encryption, which depends on sqlcipher
	cmake -DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=ON \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DSQLITECPP_INTERNAL_SQLITE='false' \
		-DSQLITE_HAS_CODEC=$_has_sqlcipher \
		-DSQLITECPP_RUN_CPPLINT='false' \
		-DSQLITECPP_RUN_CPPCHECK='false' ..
	cmake --build .
}
package() {
	cd "$_dirname-$pkgver"
	cmake --build build --target install DESTDIR="$pkgdir"
	install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'docs/README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
