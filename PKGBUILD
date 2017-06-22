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
pkgver=46.0.2597.26
pkgrel=1
pkgdesc="A fast and secure web browser"
url="http://www.opera.com/"
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
arch=('x86_64')
depends=('gtk3' 'alsa-lib' 'libnotify' 'gconf' 'curl' 'nss' 'libcups' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
'opera-ffmpeg-codecs: playback of proprietary video/audio (AUR)'
    'upower: opera battery save'
)
source=(
    "http://get.geo.opera.com/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_amd64.deb"
    "opera"
    "default"
)
sha512sums=('1c3670463ce8122d648833493aab9b2171b845449ebee0469354d2cdf22ab558c5bc27446efd048960da56b178f105a9d917b06226a7004bf199e43aad1e6f7f'
            '7e854e4c972785b8941f60117fbe4b88baeb8d7ca845ef2e10e8064043411da73821ba1ab0068df61e902f242a3ce355b51ffa9eab5397ff3ae3b5defd1be496'
            'ddb1773877fcfd7d9674e63263a80f9dd5a3ba414cda4cc6c411c88d49c1d5175eede66d9362558ddd53c928c723101e4e110479ae88b8aec4d2366ec179297f')

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

