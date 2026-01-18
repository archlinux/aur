# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('textparser')
pkgver='0.7.0'
pkgrel=1
options=(!debug)
pkgdesc='Flexible and eazy to integrate text parser library written in C.'
provides=("textparser=$pkgver" "libtextparser=$pkgver")
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/textparser'
license=('MIT')
makedepends=('gcc' 'cmake' 'ninja')
depends=('glibc' 'pcre2' 'json-c' 'python' 'gcc-libs')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz")

sha512sums=('2431d05beed13488c5dfc59248c51a70f6df3837c624cabf0f1265845c986d2245d136be27f2fde68e771390507c9cb1a784161f2437e3ead7747b221ca969d9')

build() {
    sed -i 's/add_subdirectory(tests)/#add_subdirectory(tests)/' "$pkgname-$pkgver/CMakeLists.txt"
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja -DINSTALL_GTEST=OFF -DCMAKE_BUILD_TYPE=Release "$pkgname-$pkgver"
    cmake --build "$pkgname-$pkgver/build" --target libtextparser --target libtextparser-json --target ccat --config Release
}

package() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm755 "$srcdir/$pkgname-$pkgver/definitions/json2h.py" "$pkgdir/usr/bin/textparser_json2h.py"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
