# Maintainer:  Alessandro Marchioro <marciozgaming@gmail.com>
# Co-Maintainer: Cp Dong <cp-dong at outlook dot com>
pkgname=apple-fonts
pkgver=1.0.5
pkgrel=1
pkgdesc='Apple San Francisco, New York fonts, directly from Apple official source'
arch=(any)
url='https://developer.apple.com/fonts/'
license=('custom')
provides=('ttf-font')
depends=()
makedepends=(p7zip)
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Compact.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/NY.dmg'
        'LICENSE.THE-APPLE-SF-PRO-FONT'
        'LICENSE.THE-APPLE-SF-COMPACT-FONT'
        'LICENSE.THE-APPLE-SF-MONO-FONT'
        'LICENSE.THE-APPLE-NEW-YORK-FONT')
sha256sums=('32ed299b1dce5a228198c1182cd83ebb633114444ad3b05019edd602111e7394'
            '3247fe18ae22b94859754773316d1550e99771770849e8e131e6559b4b9a4706'
            'b591d5ea0e36ef3a98ceb35fdf00b0882879563a3c3c06a2f6e12f6b260fb233'
            'b67d502c24a3828e6ae0fc04ff07bcd2925abebde71d58055ab67c729dbda819'
            '18273048eee4851c929531c954a5c36bbd897404e49c69309a3fc452973c3885'
            'a3c5661529d654e92e7310fc2572eae7f6a165db54be918e2bee35afb39159f1'
            '079512256688e048803fedeb087eaaf8a3109448f160c6f84c6561f4eb763296'
            '5579b2b33d529bd51efab1f378e5c600aafd8fe1481f3c28e5d914742c801ba2')
noextract=("${source[@]##*/}")

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
        LICENSE.THE-APPLE-SF-PRO-FONT LICENSE.THE-APPLE-SF-COMPACT-FONT \
        LICENSE.THE-APPLE-SF-MONO-FONT LICENSE.THE-APPLE-NEW-YORK-FONT
    
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/fonts"/*
}
