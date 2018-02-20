# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=2.0.3
pkgrel=1
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz"
        "version-fix.patch")
sha256sums=('830d3a2ba7c185d6e79c56979ec639432f993969b28b738ee2cedfdd4469bc87'
            '6d693ba3f7ac69e51baad8afdbeba8b3627ff5cda20226d6ab6e669846b43e5f')
depends=('qt5-base')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir build cli-build
    patch -p1 < ../version-fix.patch
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    qmake PREFIX="/usr" DEFINES+="DWR_RELEASE" ../dwrandomizer.pro
    make
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    qmake PREFIX="/usr" DEFINES+="DWR_RELEASE" ../dwrandomizer-cli.pro
    make
}

package() {
    mkdir -p $pkgdir/usr/bin
    cd "$srcdir/$pkgname-$pkgver/build"
    cp dwrandomizer $pkgdir/usr/bin/
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    cp dwrandomizer-cli $pkgdir/usr/bin/
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    cp "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
