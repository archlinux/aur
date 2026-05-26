# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('textparser')
pkgver='0.8.0'
pkgrel=1
options=(!debug)
pkgdesc='Flexible and eazy to integrate text parser library written in C.'
provides=("textparser=$pkgver" "libtextparser=$pkgver")
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/textparser'
license=('MIT')
makedepends=('gcc' 'cmake' 'ninja')
depends=('glibc' 'pcre2' 'json-c' 'python')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('bf4acb42dda0c181838811553f6be32a3a89072efa64f6c00035efb960777751981b4ae550451bf59fa51f40acca4eaffcea2ad3bafc4030b2753b8e17bc61c3')

build() {
    sed -i 's/add_subdirectory(tests)/#add_subdirectory(tests)/' "$pkgname-$pkgver/CMakeLists.txt"
    (cd $pkgname-$pkgver/definitions; ./regenerate.sh)
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" -DTEXTPARSER_VERSION_TAG=$pkgver -B"$pkgname-$pkgver/build" -G Ninja -DCMAKE_BUILD_TYPE=Release "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build" --target libtextparser --target libtextparser-json --target ccat --target textparser --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm755 "$srcdir/$pkgname-$pkgver/definitions/json2h.py" "$pkgdir/usr/bin/textparser_json2h.py"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
