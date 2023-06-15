# Maintainer: Thomas McGrew <tjmcgrew@gmail.com>
pkgname=dwrandomizer
pkgver=3.0.3
pkgrel=1
epoch=
pkgdesc="A Randomizer for Dragon Warrior for NES"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://dwrandomizer.com"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mcgrew/dwrandomizer/archive/$pkgver.tar.gz")
sha256sums=('99068bc40d3f2cbe2fcb4e098bef0b4e8972b4150ed4aaf0c7a0b277c7d7c024')
depends=('electron')
makedepends=('emscripten' 'ed')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir build cli-build
}

build() {
    cd "$srcdir/$pkgname-$pkgver/build"
    CFLAGS="-O2 -pipe -fno-stack-protector -fno-plt" LDFLAGS="-Wl,-O1" cmake -DRELEASE=1 -DCMAKE_TOOLCHAIN_FILE=/usr/lib/emscripten/cmake/Modules/Platform/Emscripten.cmake ..
    make
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    cmake -DRELEASE=1 ..
    make
}

package() {
    mkdir -p $pkgdir/usr/share/dwrandomizer
    mkdir -p $pkgdir/usr/bin/
    cd "$srcdir/$pkgname-$pkgver/electron"
    cp -Lr * $pkgdir/usr/share/dwrandomizer
    echo -e '#!/bin/sh\n\nelectron /usr/share/dwrandomizer' > $pkgdir/usr/bin/dwrandomizer
    chmod +x $pkgdir/usr/bin/dwrandomizer
    cd "$srcdir/$pkgname-$pkgver/cli-build"
    mv dwrandomizer dwrandomizer-cli
    install -D -t $pkgdir/usr/bin/ dwrandomizer-cli
    install -D -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$pkgver/LICENSE"
    install -D -t "$pkgdir/usr/share/applications/" "$srcdir/$pkgname-$pkgver/resources/dwrandomizer.desktop"

    #install the icons
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_512x512.png" "$pkgdir/usr/share/icons/512x512/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_256x256.png" "$pkgdir/usr/share/icons/256x256/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_128x128.png" "$pkgdir/usr/share/icons/128x128/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_64x64.png" "$pkgdir/usr/share/icons/64x64/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_32x32.png" "$pkgdir/usr/share/icons/32x32/dwrandomizer.png"
    install -D -T "$srcdir/$pkgname-$pkgver/electron/build/icons/icon_16x16.png" "$pkgdir/usr/share/icons/16x16/dwrandomizer.png"
}
