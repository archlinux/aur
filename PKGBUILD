# Maintainer: otreblan <otreblain@gmail.com>
# Contributor: Marat Moustafine <moustafine-@t-tuta-d.t-io>

pkgname=drogon
pkgver=1.8.3
pkgrel=2
pkgdesc='A C++14/17 based HTTP web application framework running on Linux/macOS/Unix/Windows'
arch=('x86_64')
url="https://github.com/an-tao/drogon"
license=('MIT')
depends=('brotli' 'c-ares' 'jsoncpp' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'hiredis' 'trantor')
makedepends=('cmake' 'mariadb' 'postgresql' 'util-linux')
source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
	"$url/pull/1520.diff"
)
sha256sums=(
	'db6d92a0c40ec52d5704fb4128860b9eecdc284653e8d85113b4219b96dc7129'
	'SKIP'
)

prepare() {
	cd "$pkgname-$pkgver"
	patch --forward --strip=1 --input="$srcdir/1520.diff"
}

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_CXX_FLAGS_RELEASE="$CXXFLAGS" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DUSE_SUBMODULE=OFF

	cmake --build build
}

package() {
	install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	DESTDIR="$pkgdir" cmake --install build
}
