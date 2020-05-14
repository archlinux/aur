# Maintainer: sum01 <sum01@protonmail.com>
pkgname=sqlitecpp
_dirname='SQLiteCpp'
pkgver=3.0.0
pkgrel=2
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
sha512sums=('bbff198c1be2d4e7e596fc51b55808170f9fa1f37557209b92e49ba3017d367ea8e3df67518320a0d0c5afb5db9bfc0e599676e20b2fbb4ce8adcb831a4218ac')
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
	cd "$_dirname-$pkgver/build"
	cmake --build . --target install DESTDIR="$pkgdir"
	cd ..
	install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'docs/README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
