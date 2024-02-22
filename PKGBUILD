# Maintainer: Cp Dong <cp-dong at outlook dot com>
pkgname=apple-sf-script-extension-fonts
pkgver=1.0
pkgrel=1
pkgdesc='Apple SF Script Extensions, containing SF Arabic, SF Armenian, SF Georgian and SF Hebrew, designed to fit with SF Pro for multilingual typesetting'
arch=(any)
url='https://developer.apple.com/fonts/'
license=('custom')
depends=()
makedepends=(p7zip)
optdepends=('apple-fonts: Apple San Francisco, New York fonts')
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Armenian.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg'
        'LICENSE.THE-APPLE-SAN-FRANCISCO-FONT')
noextract=("${source[@]##*/}")
sha256sums=('56f7e5f41c8ac30e79944dd14c8c784ce11fbb256410d08c6c72d81462e1a76a'
            'a0948fea06a60cbb080a47aa380fb7472d8213e94eccdc9db25119953c75d794'
            '0d60f262edb2ee4b80a8a3c33520981b0f48a7a21dbdd18c752002bac8842f91'
            '2266990808ad3602277c1a278cf2119ba5c580dc12cf7d4bcc8b26be8c49d340'
            'd01bdb70f65b7c4df3da4dc2edd9ba1e65c4fb72cb5b39c226e19e2b1c44c178')

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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.THE-APPLE-SAN-FRANCISCO-FONT
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/fonts"/*
}
