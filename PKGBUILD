# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver=0.19.57.20260222
pkgrel=1
pkgdesc="An easy to use and fast Minecraft world viewer and mapper tool"
arch=('x86_64')
url="https://unmined.net/"
depends=('fontconfig' 'gcc-libs' 'glibc')
makedepends=('zstd')
license=('LicenseRef-unmined')
# Upstream bundle fails to launch if stripped.
options=('!strip' '!debug')
source=("unmined-gui-dev_amd64.deb::https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/")
sha256sums=('9badbb3c6c44870c40cf38e096fd5a87b52a4b30b2a733631acadea0a7505a2d')

latestver() {
    local page
    page=$(curl -fsSL "https://unmined.net/downloads/")
    local ver
    ver=$(echo "$page" | grep -oP 'title="uNmINeD CLI.*\([0-9]+\.[0-9]+\.[0-9]+\)"' | \
        head -n1 | sed -E 's/.*\(([0-9]+\.[0-9]+\.[0-9]+)\).*/\1/')
    local tmstv
    tmstv=$(echo "$page" | grep -oP 'tmstv=\K\d+' | head -n1)
    local stamp
    stamp=$(date -d "@$tmstv" +%Y%m%d 2>/dev/null)
    echo "${ver}.${stamp}"
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
