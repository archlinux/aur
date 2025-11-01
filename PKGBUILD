# Maintainer: Yakov Till <yakov.till at gmail dot com>
# Contributor: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver=0.19.51
pkgrel=1
pkgdesc="An easy to use and fast Minecraft world viewer and mapper tool"
arch=('x86_64')
url="https://unmined.net/"
depends=()
makedepends=('zstd' 'curl')
license=('custom')
options=(!strip)
source=("unmined-gui-dev_amd64.deb::https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/")
sha256sums=('29b81b79617f7a61703760eb0918ace757e223d753435e26398c9d49e13d91cb')

pkgver() {
    curl -fsSL "https://unmined.net/downloads/" | \
    grep -oP 'title="uNmINeD CLI.*\([0-9]+\.[0-9]+\.[0-9]+\)"' | \
    head -n1 | sed -E 's/.*\(([0-9]+\.[0-9]+\.[0-9]+)\).*/\1/'
}

prepare() {
    mkdir -p "$srcdir/extracted"
    cd "$srcdir/extracted"
    tar --use-compress-program=unzstd -xf "$srcdir/data.tar.zst"
}

package() {
    cd "$srcdir/extracted"
    cp -a usr opt "$pkgdir/"
    chmod +x "$pkgdir/opt/unmined/unmined"
    chmod +x "$pkgdir/opt/unmined/"*.so
    install -D -m644 opt/unmined/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Fix desktop file to set correct working directory
    sed -i 's/^Path=$/Path=\/opt\/unmined/' "$pkgdir/usr/share/applications/uNmINeD.desktop"
}
