# Maintainer:  Alessandro Marchioro <marciozgaming@gmail.com>
# Co-Maintainer: Cp Dong <cp-dong at outlook dot com>
pkgname=apple-fonts
pkgver=1.0.4
pkgrel=1
pkgdesc='Apple San Francisco, New York fonts, directly from Apple official source'
arch=(any)
url='https://developer.apple.com/fonts/'
license=('custom AND custom')
depends=()
makedepends=(p7zip)
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/NY.dmg'
        'LICENSE.THE-APPLE-SAN-FRANCISCO-FONT'
        'LICENSE.THE-APPLE-SAN-FRANCISCO-COMPACT-FONT')
noextract=("${source[@]##*/}")
sha256sums=('32ed299b1dce5a228198c1182cd83ebb633114444ad3b05019edd602111e7394'
            '3247fe18ae22b94859754773316d1550e99771770849e8e131e6559b4b9a4706'
            'b591d5ea0e36ef3a98ceb35fdf00b0882879563a3c3c06a2f6e12f6b260fb233'
            'b67d502c24a3828e6ae0fc04ff07bcd2925abebde71d58055ab67c729dbda819'
            'd01bdb70f65b7c4df3da4dc2edd9ba1e65c4fb72cb5b39c226e19e2b1c44c178'
            'c9055549c252b53bed01cd74849c835ee8ff3ab3f84b65721acda6b1851ed906')

prepare() {
    cd "$srcdir"
    mkdir -p fonts src
    for archive in *.dmg; do
        7z e "$archive" -y -osrc/
        cd src/
        7z x *.pkg -y
        7z x 'Payload~'
        mv Library/Fonts/* "$srcdir/fonts/"
        cd "$srcdir"
        rm -rf src/{*,.*}
    done
    rmdir src/
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" \
        LICENSE.THE-APPLE-SAN-FRANCISCO-FONT LICENSE.THE-APPLE-SAN-FRANCISCO-COMPACT-FONT
    
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/fonts"/*
}
