# Maintainer: sum01 <sum01@protonmail.com>
pkgname=sqlitecpp
_dirname='SQLiteCpp'
pkgver=3.1.0
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
source=("$pkgname-$pkgver::https://github.com/SRombauts/SQLiteCpp/archive/${pkgver}.tar.gz"
	'0001-Fix-compilation-if-using-SQLITE_HAS_CODEC.patch')
sha512sums=('2415f2c775a9c1c4cf709cfbd9e130fbf96a116b5b526c78fc03c87fba6b91058c03584e7b1700b37063c5232ff4b93eb8f30506624cb3f507f9787bcb2e6864'
            '355ca5c9b0b26c5d9006227fb998fd2704fbbc2cdc9d9a75193b8046061d3e879df692041e9124144422ae612c3c8e40beabb6c93b10b9e8dbe245dcec85c2ca')
prepare() {
	cd "$_dirname-$pkgver"
	patch --forward --strip=1 --input="${srcdir}/0001-Fix-compilation-if-using-SQLITE_HAS_CODEC.patch"
}
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
