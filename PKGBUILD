# Maintainer:  Alessandro Marchioro <marciozgaming@gmail.com>
# Co-Maintainer: Cp Dong <cp-dong at outlook dot com>

pkgname=apple-fonts
pkgver=7.0.3
pkgrel=1
pkgdesc='Fonts for Apple platforms, including San Francisco and New York typefaces'
arch=(any)
url='https://developer.apple.com/fonts/'
license=('custom')
provides=('ttf-font')
depends=()
makedepends=(7zip)
_baseurl='https://devimages-cdn.apple.com/design/resources/download/'
source=("SF-Pro-${pkgver}.dmg::${_baseurl}SF-Pro.dmg"
        "SF-Compact-${pkgver}.dmg::${_baseurl}SF-Compact.dmg"
        "SF-Mono-${pkgver}.dmg::${_baseurl}SF-Mono.dmg"
        "NY-${pkgver}.dmg::${_baseurl}NY.dmg")
sha256sums=('2e4d7853988b734dc1af33b921d8d4c0e4400eac312924a0eab4b73a51fd69ae'
            '08c34ffac2f99ec8702b4946044469f92dd88a7b1c0864e2d4b559565f8fb8e3'
            '6d4a0b78e3aacd06f913f642cead1c7db4af34ed48856d7171a2e0b55d9a7945'
            '1c2eedb4526cc0f326f8b7ea978f5a433756476a2c8c56072537608edb88f8f4')
noextract=("${source[@]##*/}")

prepare() {
    cd "$srcdir"
    mkdir -p fonts licenses tmp
    for archive in *.dmg; do
        7z e "$archive" -y -otmp/
        cd tmp/
        7z x -txar *.pkg -y
        _fntname=`grep -o -e "THE APPLE .* FONT" Resources/English.lproj/License.rtf | head -n 1`
        mv Resources/English.lproj/License.rtf "$srcdir/licenses/LICENSE.${_fontname// /-}"
        cd *.pkg/
        _fntver=`grep -o -e ' version=".*">' PackageInfo`
        _fntver="${_fntver:10:-2}"
        7z x Payload -y
        7z x Payload\~ -y
        mv Library/Fonts/* "$srcdir/fonts/"
        cd "$srcdir"
        rm -r tmp/{*,.*}
        echo
        echo "Extracted $archive version $_fntver"
    done
    rmdir tmp/
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/licenses"/*
    install -Dm644 -t "$pkgdir/usr/share/fonts/$pkgname" "$srcdir/fonts"/*
}
