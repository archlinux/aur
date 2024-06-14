# Maintainer: Cp Dong <cp-dong at outlook dot com>
pkgname=apple-sf-script-extension-fonts
pkgver=1.1
pkgrel=1
pkgdesc='Apple SF Script Extensions, containing SF Arabic, SF Armenian, SF Georgian and SF Hebrew, designed to fit with SF Pro for multilingual typesetting'
arch=(any)
url='https://developer.apple.com/fonts/'
license=('custom')
depends=('apple-fonts')
makedepends=(p7zip)
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Arabic.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Armenian.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Georgian.dmg'
        'https://devimages-cdn.apple.com/design/resources/download/SF-Hebrew.dmg'
        'LICENSE.THE-APPLE-SAN-FRANCISCO-FONT')
noextract=("${source[@]##*/}")
sha256sums=('d5c941a7e69e3d22cd47d26b4be8d1787ee9109b6c1fece9cec88128b42fbd4b'
            '00332b773b25bc0400f5e2edcdf46d521f3d778f76d4d4755f8bdeb1d917cfb5'
            '3bc1a6f5a1d728982d0cdf3c660352d1b4afed06f7ef45413ef033f1ec7770be'
            '04f35fa56d704b21e0179da1e4867c20a70582f39400d20f3247d1718dff03ce'
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
