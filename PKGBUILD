# Maintainer: Grisshink <grisshink@mail.ru>
pkgname=scrap-git
pkgver=0.5.1.r5.g32ce623
pkgrel=1
pkgdesc="New advanced block based programming language, built from ground up in C"
arch=(x86_64)
url="https://github.com/Grisshink/scrap"
license=(Zlib)
depends=(libx11 libxrandr libxcursor libxinerama libxi)
makedepends=('git' gettext)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Grisshink/scrap.git'
        'git+https://github.com/raysan5/raylib.git'
        scrap.desktop)
sha256sums=('SKIP'
            'SKIP'
            '872b6fd2079dbcc1859e524ee5807a1c8cfb8d898fa5df0143ca1b1f0c1306a2')

pkgver() {
    cd "scrap"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-beta//;s/\([^-]*-g\)/r\1/;s/-/./g' 
}

prepare() {
    cd "scrap"
    git submodule init
    git config submodule.raylib.url "$srcdir/raylib"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "scrap"
    make SCRAP_VERSION="$pkgver"
}

package() {
    install -D scrap.desktop "$pkgdir/usr/share/applications/scrap.desktop"

    cd "scrap"
    make PREFIX="$pkgdir/usr" install

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D extras/scrap.png "$pkgdir/usr/share/pixmaps/scrap.png"
}
