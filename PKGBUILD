# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('textparser')
pkgver='0.9.0'
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

sha512sums=('0bdb9fbf7977ac4916e174e8ff78e721b57057f2af907ac4b76712e61dbe2bce21a32c99d66907cb9ab08886ced90d9b56ef7f131e172823eebd08d7f02289c4')

build() {
    (cd $pkgname-$pkgver/definitions; ./regenerate.sh)
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" -DTEXTPARSER_VERSION_TAG=$pkgver -DBUILD_TESTS=OFF -B"$pkgname-$pkgver/build" -G Ninja -DCMAKE_BUILD_TYPE=Release "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build" --target libtextparser --target libtextparser-json --target ccat --target textparser --config Release
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm755 "$srcdir/$pkgname-$pkgver/definitions/json2h.py" "$pkgdir/usr/bin/textparser_json2h.py"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -dm755 "$pkgdir/usr/share/$pkgname/definitions"
    install -m644 "$srcdir/$pkgname-$pkgver/definitions/"*_definition.json "$pkgdir/usr/share/$pkgname/definitions/"
}
