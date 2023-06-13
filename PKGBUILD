# Maintainer: SDKBN
# Credit to sum01 
pkgname=sqlitecpp
_dirname='SQLiteCpp'
pkgver=3.3.0
pkgrel=1
pkgdesc='A smart and easy to use C++ SQLite3 wrapper.'
arch=('i686' 'x86_64')
url='https://github.com/SRombauts/SQLiteCpp'
license=('MIT')
depends=('sqlite>=3.19')
optdepends=('sqlcipher: for database encryption API')
makedepends=('cmake>=3.1')
source=("$pkgname-$pkgver::https://github.com/SRombauts/SQLiteCpp/archive/${pkgver}.tar.gz")
sha512sums=('9702b17c55b1b3bc46a72d5c204b560249e9c1f02647c864fd4ca54011e4b0238638800ee870baa5106512a9568338d3faa9c9f9799d42fbd558d10376e3b73a')
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
		-DSQLITECPP_INCLUDE_SCRIPT=OFF \
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
