# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver=0.19.60.20260610
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
sha256sums=('2af848691a21d79a384c2af5370cd07744856ed85170ed70be92aee945da8be1')

latestver() {
    local page tmstv tmp ver stamp

    page=$(curl -fsSL 'https://unmined.net/downloads/') || return 1
    tmstv=$(printf '%s\n' "$page" |
        sed -nE 's#.*href="https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/\?tmstv=([0-9]+)".*#\1#p' |
        head -1)
    [[ -n ${tmstv} ]] || return 1

    tmp=$(mktemp) || return 1
    trap 'rm -f "$tmp"' RETURN
    curl -fsSL 'https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/' -o "$tmp" || return 1
    ver=$(bsdtar -xOf "$tmp" control.tar.zst | tar --zstd -xOf - ./control |
        sed -nE 's/^Version: ([0-9.]+)-dev$/\1/p')
    [[ -n ${ver} ]] || return 1

    stamp=$(date -u -d "@${tmstv}" +%Y%m%d 2>/dev/null) || return 1
    printf '%s\n' "${ver}.${stamp}"
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
