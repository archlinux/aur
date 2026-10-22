# Maintainer: Hash-AK <HashAKAUR [at] duck [dot] com>

pkgname=slick-mod
pkgver=2.0.139
pkgrel=1
_tag=139
_electron=electron44 # Slack's version
pkgdesc="The most powerful and versatile Slack client mod (uses system Electron)"
arch=('x86_64')
url="https://github.com/3kh0/slick"
license=('GPL-3.0-or-later')
depends=(
    'slack-desktop'
    'alsa-lib'
    'mesa'
    "$_electron"
)
makedepends=(
    'nodejs>=22'
    'bun'
    )
source=(
    "slick-v$_tag.tar.gz::https://github.com/3kh0/slick/archive/refs/tags/v$_tag.tar.gz"
    "dev.slick.byoe.desktop"
    "slick-mod.install"
    "slick-mod.sh"
)
sha256sums=('07c47baa79621650b1c867ca071de3a4e34a0f62d12f7af0516a720b31e1fe6e'
            '8cf302c0a4548fba0afabf217ed3fec1d6e68f7a4a5c780914a8ff8d4f76ba66'
            '1931b1164e44f69d501328c6988822f20317cb9afedd1d38b9b05dff6267c0a3'
            '7a626061948c291ad355c936d2733b9a4d215f9484169edb5e0987ab10b2df04')
options=('!debug')
install=slick-mod.install
prepare(){
    sed -i "s/_electron_/$_electron/" "$srcdir/$pkgname.sh"
}
build(){
    export SLICK_BUILD="$_tag"
    export SLICK_VERSION="$pkgver"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    cd "$srcdir/slick-$_tag"
    bun install --frozen-lockfile --ignore-scripts --cpu=x64 --os=linux
    rm -rf node_modules/.cache node_modules/.bun
    node scripts/build.ts desktop

}
package(){
    local resources="$pkgdir/usr/lib/slick/resources"
    cd "$srcdir/slick-$_tag"
    install -d "$resources/app/"
    cp -a "$srcdir/slick-$_tag/dist/desktop/." "$resources/app"
    install -d "$resources/themes" "$resources/monaco" "$resources/tray"
    cp -a "$srcdir/slick-$_tag/themes/." "$resources/themes/"
    install -Dm644 "$srcdir/slick-$_tag/dist/desktop/slick.js" "$resources/slick.js"
    cp -a "$srcdir/slick-$_tag/dist/desktop/monaco/." "$resources/monaco/"
    cp -a "$srcdir/slick-$_tag/assets/tray/." "$resources/tray/"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/slick" 
    for size in 16 32 64 128 256 512;do
        ICON_DIR="$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps"
        mkdir -p "$ICON_DIR"
        cp ./assets/desktop-linux/$size.png $ICON_DIR/slick.png        
    done
    mkdir -p "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/dev.slick.byoe.desktop" "$pkgdir/usr/share/applications/dev.slick.byoe.desktop"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"


}
