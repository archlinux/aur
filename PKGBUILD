# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=repaq
pkgver=0.5.1
pkgrel=1
pkgdesc="Fast lossless FASTQ compressor with ultra-high compression ratio"
arch=('x86_64')
url="https://github.com/OpenGene/repaq"
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('19720e87ce83327d8c8de6176fa85bb32ada4d722eea86ee5210d2d55cd4e787')

prepare() {
    cd "$srcdir/repaq-$pkgver"
    # GCC 15: missing <cstdint> include; narrowing in brace-init is an error
    sed -i '1i #include <cstdint>' src/endian.cpp
}

build() {
    cd "$srcdir/repaq-$pkgver"
    make CFLAGS="-std=c++11 -g -I./inc -O3 -Wno-narrowing"
}

check() {
    cd "$srcdir/repaq-$pkgver"
    ./repaq --version
}

package() {
    cd "$srcdir/repaq-$pkgver"
    install -Dm755 repaq "$pkgdir/usr/bin/repaq"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
