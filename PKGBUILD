# Maintainer: Hugo Haldi <hugo dot haldi at gmail dot com>

pkgname=swift-format
pkgver=600.0.0
pkgrel=3
pkgdesc="Formatting technology for Swift source code"
url="https://github.com/apple/swift-format"
arch=('i686' 'x86_64')
license=('Apache-2.0')
depends=('swift-language')
makedepends=('git')
source=(
  swift-format-${pkgver}.tar.gz::https://github.com/apple/swift-format/archive/${pkgver}.tar.gz
  0001-Fix-infinite-loop-on-Windows-caused-by-checking-path.patch
)
sha256sums=('5d03930216701939bd34f82575a475bcb8d1962e095066449eedc5e22226d8b6'
            '15b59fbab0cdea348b9888260d5615320a1610ff8a9921438e81fd59cd42f9e8')
prepare() {
    patch -d $pkgname-$pkgver -Np1 < "$srcdir/0001-Fix-infinite-loop-on-Windows-caused-by-checking-path.patch"
    rm -rf swift-format
    mv swift-format-${pkgver} swift-format
}

build() {
    cd "$srcdir/swift-format"
    swift build -c release
}

check() {
    cd "$srcdir/swift-format"
    swift test --parallel
}

package() {
    cd "$srcdir/swift-format"
    mkdir -p "$pkgdir/usr/bin"
    install -m755 .build/release/swift-format "$pkgdir/usr/bin"
}
