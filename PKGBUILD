# vim:set ft=sh:
# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Bartłomiej Piotrowski <barthalion@gmail.com>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: ruario <ruario AT opera DOT com>
# Contributor: Daniel Isenmann <daniel AT archlinux DOT org>
# Contributor: dorphell <dorphell AT archlinux DOT org>
# Contributor: Sigitas Mazaliauskas <sigis AT gmail DOT com>
# Contributor: eworm

pkgname=opera
pkgver=42.0.2393.517
pkgrel=1
pkgdesc="A fast and secure web browser"
url="http://www.opera.com/"
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
arch=('i686' 'x86_64')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'libxtst' 'gconf' 'libxss' 'alsa-lib' 'nss' 'ttf-font' 'libnotify' 'hicolor-icon-theme')
optdepends=(
    'curl: opera crash reporter and autoupdate checker'
    'opera-ffmpeg-codecs: playback of proprietary video/audio'
    'upower: opera battery save'
)
source=(
    "opera"
    "default"
)
source_i686=("http://get.geo.opera.com/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_i386.deb")
source_x86_64=("http://get.geo.opera.com/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_amd64.deb")
sha256sums=('508512464e24126fddfb2c41a1e2e86624bdb0c0748084b6a922573b6cf6b9c5'
            '4913d97dec0ddc99d1e089b029b9123c2c86b7c88d631c4d1111b119b09da027')
sha256sums_i686=('7adfde89983817606091b791fa7cd2280e7d877ccaaed83271c85e9ba979b0fd')
sha256sums_x86_64=('b706cff64dc2b14fbd11b6842377dc2e16e97098bbba41a865f3d07cfba6d313')

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
    sed -e "s/%operabin%/$pkgname\/$pkgname/g" \
        -i "$srcdir/opera"
}

package() {
    tar -xf data.tar.xz --exclude=usr/share/{lintian,menu} -C "$pkgdir/"

    # get rid of the extra subfolder {i386,x86_64}-linux-gnu
    (
        cd "$pkgdir/usr/lib/"*-linux-gnu/
        mv "$pkgname" ../
    )
    rm -rf "$pkgdir/usr/lib/"*-linux-gnu

    # suid opera_sandbox
    chmod 4755 "$pkgdir/usr/lib/$pkgname/opera_sandbox"

    # install default options
    install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

    # install opera wrapper
    rm "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"

    # license
    install -Dm644 \
        "$pkgdir/usr/share/doc/${pkgname}-stable/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}

