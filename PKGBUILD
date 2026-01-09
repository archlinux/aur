# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver=0.19.54
pkgrel=2
pkgdesc="An easy to use and fast Minecraft world viewer and mapper tool"
arch=('x86_64')
url="https://unmined.net/"
depends=('fontconfig' 'gcc-libs' 'glibc')
makedepends=('zstd')
license=('LicenseRef-unmined')
# Upstream bundle fails to launch if stripped.
options=('!strip' '!debug')
source=("unmined-gui-dev_amd64.deb::https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/")
sha256sums=('93cb584f2f9bb0ce2c19f6af4a462935bb4fcd6e3784c381d3e898347d539f3f')

latestver() {
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
