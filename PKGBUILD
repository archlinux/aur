# Maintainer: Casper Dong <cp-dong at outlook dot com>
pkgname=apple-sf-script-extension-fonts
pkgver=6.0.1.1726709071
pkgrel=1
pkgdesc='Apple SF Script Extensions, including SF Arabic, SF Armenian, SF Georgian, and SF Hebrew'
arch=(any)
url='https://developer.apple.com/fonts/'
license=('custom')
depends=('apple-fonts')
makedepends=(p7zip)
_baseurl='https://devimages-cdn.apple.com/design/resources/download/'
source=("${_baseurl}SF-Arabic.dmg"
        "${_baseurl}SF-Armenian.dmg"
        "${_baseurl}SF-Georgian.dmg"
        "${_baseurl}SF-Hebrew.dmg")
noextract=("${source[@]##*/}")
sha256sums=('2760c62d502b77012c49517c2ea392ec2d4c647fe060985c927df48d105197b9'
            'ffd715ae93d7c215be3f434b84624184779bb50b2bb3d66b8fd42880c65fadad'
            'c16b1798472b26232445331ea51ac8299260674fe8fb7f3a354eedeb5390a2d2'
            '3258e40715b8bcf45e9441dbbf7218aeeaa570065dcc1f7bfa55c9ed6d0b9384')

prepare() {
    cd "$srcdir"
    mkdir -p fonts licenses tmp
    for archive in *.dmg; do
        7z e "$archive" -y -otmp/
        cd tmp/
        7z x *.pkg -y
        font=`grep -o -e "THE APPLE .* FONT" Resources/English.lproj/License.rtf | head -n 1`
        mv Resources/English.lproj/License.rtf "$srcdir/licenses/LICENSE.${font// /-}"
        cd *.pkg/
        7z x Payload -y
        7z x 'Payload~' -y
        mv Library/Fonts/* "$srcdir/fonts/"
        cd "$srcdir"
        rm -r tmp/{*,.*}
    done
    rmdir tmp/
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/licenses"/*
    
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/fonts"/*
}
