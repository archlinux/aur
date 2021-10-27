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
pkgver=80.0.4170.72
pkgrel=1
pkgdesc="A fast and secure web browser"
url="https://www.opera.com/"
options=(!strip !zipman)
license=('custom:opera')
backup=("etc/$pkgname/default")
arch=('x86_64')
depends=('gtk3' 'alsa-lib' 'libnotify' 'curl' 'nss' 'libcups' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
optdepends=(
    'opera-ffmpeg-codecs: playback of proprietary video/audio'
    'upower: opera battery save'
)
source=(
    "https://get.geo.opera.com/pub/${pkgname}/desktop/${pkgver}/linux/${pkgname}-stable_${pkgver}_amd64.rpm"
    "opera"
    "default"
    'eula.html'
    'terms.html'
    'privacy.html'
)
sha512sums=('1bf1d8aa1b488631d7d5be9c1cd2a8da1672e15ca723a9540a422454a71dad0853608d6953ce17177c1045a2eb791c44ca8770a99ad3a99dcdd582ce6642ab29'
            '7e854e4c972785b8941f60117fbe4b88baeb8d7ca845ef2e10e8064043411da73821ba1ab0068df61e902f242a3ce355b51ffa9eab5397ff3ae3b5defd1be496'
            'ddb1773877fcfd7d9674e63263a80f9dd5a3ba414cda4cc6c411c88d49c1d5175eede66d9362558ddd53c928c723101e4e110479ae88b8aec4d2366ec179297f'
            '9375bf365ace213266bd1c94e14357b22483c5c0bd0cf49119be1c0a76b8dc042b6cd61ca11d36d32baa12c595eb40311604b82a8344bf9119440813d0d6a042'
            'cc2a03c3ac3fedc7beb5ab2bedf408427ae2e0e1628395ad8b2d114ae4165462e7c6913040b3fc880e9d5dc2b922d132012134a3e96cb735060a7388aa25cb3f'
            '01884e782917068175cf3ddee4f3063cbc710099491d0bcba7c6e477b312f4835bfb9588ada7e05c51338ced8f9a733a055d418fc020a8fb95ca24074f7b3bd6')

prepare() {
    sed -e "s/%pkgname%/$pkgname/g" -i "$srcdir/opera"
    sed -e "s/%operabin%/$pkgname\/$pkgname/g" \
        -i "$srcdir/opera"

}

package() {
    install -dm755 "$pkgdir/usr"
    cp -a usr/share "$pkgdir/usr/"
    cp -a usr/lib64 "$pkgdir/usr/lib"

    # suid opera_sandbox
    chmod 4755 "$pkgdir/usr/lib/$pkgname/opera_sandbox"

    # install default options
    install -Dm644 "$srcdir/default" "$pkgdir/etc/$pkgname/default"

    # install opera wrapper
    #rm "$pkgdir/usr/bin/$pkgname"
    install -Dm755 "$srcdir/opera" "$pkgdir/usr/bin/$pkgname"

    # license
    #install -Dm644 \
        #"$pkgdir/usr/share/doc/${pkgname}-stable/copyright" \
        #"$pkgdir/usr/share/licenses/$pkgname/copyright"

    # eula
    install -Dm644 \
        "$srcdir/eula.html" \
        "$pkgdir/usr/share/licenses/$pkgname/eula.html"

    # terms
    install -Dm644 \
        "$srcdir/terms.html" \
        "$pkgdir/usr/share/licenses/$pkgname/terms.html"

    # privacy
    install -Dm644 \
        "$srcdir/privacy.html" \
        "$pkgdir/usr/share/licenses/$pkgname/privacy.html"
}

