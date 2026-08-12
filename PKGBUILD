# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: Maciej Dems <macdems@gmail.com>
pkgname=unmined-gui
pkgver=0.19.60.20260812
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
    local tmp ver ctrl_size tmstv stamp

    # tmstv cache-buster on the downloads page encodes the build timestamp.
    tmstv=$(curl -fsSL 'https://unmined.net/downloads/' 2>/dev/null |
        sed -nE 's#.*href="https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/\?tmstv=([0-9]+)".*#\1#p' |
        head -1)
    [[ -n ${tmstv} ]] || return 1
    stamp=$(date -u -d "@${tmstv}" +%Y%m%d 2>/dev/null) || return 1

    tmp=$(mktemp) || return 1
    trap 'rm -f "$tmp"' RETURN

    # ar(5) .deb partial read: 132-byte fixed prefix → parse control.tar.zst
    # body size from ar header → read exactly that many more bytes (~500 B total).
    curl -fsSL 'https://unmined.net/download/unmined-gui-linuxdeb-x64-dev/' 2>/dev/null | {
        dd bs=1 count=132 iflag=fullblock of="$tmp" 2>/dev/null
        ctrl_size=$(dd if="$tmp" bs=1 skip=120 count=10 2>/dev/null | tr -d ' ')
        [[ -n "$ctrl_size" && "$ctrl_size" -gt 0 ]] 2>/dev/null || exit 1
        dd bs=1 count="$ctrl_size" iflag=fullblock >>"$tmp" 2>/dev/null
    }

    ver=$(bsdtar -xOf "$tmp" control.tar.zst 2>/dev/null |
          tar --zstd -xOf - ./control 2>/dev/null |
          sed -nE 's/^Version: ([0-9.]+)-dev$/\1/p')
    [[ -n ${ver} ]] || return 1

    printf '%s.%s\n' "$ver" "$stamp"
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
