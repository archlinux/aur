# Maintainer: Hash-AK <HashAKAUR [at] duck [dot] com>

pkgname=slick-mod-bundled
pkgver=2.0.140
pkgrel=1
_tag=140
pkgdesc="The most powerful and versatile Slack client mod (bundled Electron version)"
arch=('x86_64')
url="https://github.com/3kh0/slick"
license=('GPL-3.0-or-later')
provides=(slick-mod)
conflicts=(slick-mod)
depends=(
    'slack-desktop'
    'alsa-lib'
    'mesa'
)
makedepends=(
    'nodejs>=22'
    'bun'
)
source=(
    "slick-v$_tag.tar.gz::https://github.com/3kh0/slick/archive/refs/tags/v$_tag.tar.gz"
    "slick-mod-bundled.install"
    "dev.slick.byoe.desktop"
)
sha256sums=('c48a53d99dc889d8aaa608d9c1b122ccf625c6442648bc73aedfb4a507b6bf51'
            'f2ec4e5998de279b20d7dff0003d10e49d05e56f4b8e9a22cf5f9b1818b0666a'
            '2473a343df0139faaeaa66a2bb1ca2ee77997499c40e3954944fba2c57313a9e')
options=('!debug')
install=slick-mod-bundled.install

build(){
    export SLICK_BUILD="$_tag"
    export SLICK_VERSION="$pkgver"
    cd "$srcdir/slick-$_tag"
    bun install --frozen-lockfile --ignore-scripts --cpu=x64 --os=linux
    node scripts/build.ts package --dir --arch x64

}
package(){
    local targetdir="$pkgdir/opt/$pkgname"
    cd "$srcdir/slick-$_tag"
    install -dm755 "$targetdir"
    cp -a "$srcdir/slick-$_tag/dist/release/linux-unpacked/." "$targetdir/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/slick" "$pkgdir/usr/bin/slick"
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/dev.slick.byoe.desktop" "$pkgdir/usr/share/applications/dev.slick.byoe.desktop"
        for size in 16 32 64 128 256 512;do
        ICON_DIR="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p "$ICON_DIR"
        cp ./assets/desktop-linux/$size.png $ICON_DIR/slick.png        
    done
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    
}
