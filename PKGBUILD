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
pkgver=75.0.3969.218
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
sha512sums=('bc37a6851bb27b6cd15078299f225dc057f590866ac07cf60c6b5c14b51af897e6ca53d9c6fa4c707e687de3fd447c72234aeedb6685b8523890c82d6c413b41'
            '7e854e4c972785b8941f60117fbe4b88baeb8d7ca845ef2e10e8064043411da73821ba1ab0068df61e902f242a3ce355b51ffa9eab5397ff3ae3b5defd1be496'
            'ddb1773877fcfd7d9674e63263a80f9dd5a3ba414cda4cc6c411c88d49c1d5175eede66d9362558ddd53c928c723101e4e110479ae88b8aec4d2366ec179297f'
            '56e0877b7827636871a3c3f0c582603049bcfe192938453a91737b15d2d7f61a3e811f76fe223851a953f64e602503ca860287dc4825b07bb2438acca39f2ffe'
            '669318641ec68160535ba3f5fc9939b6daedbe6c26ede42e623ed88b34936bc6cd78b061ac971d2ac2232a23bb3af7d37ce1fd0b4d0091d91eae4cb5d59ac1d5'
            '139527ac1af142da869ece3804015c2aa88f024bc33a35c2dd243e34c4eeaa823df08d42d8fe22c836af182af96134ee61c1c06414d7f08e0ab831f87a5a32fa')

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

