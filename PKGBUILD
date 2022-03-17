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
pkgver=84.0.4316.42
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
sha512sums=('3cee8492dbbe7a88d2dc63db133ad2ea78458fdf3c6c2b1d45c12e91bfe43f1c53c06357473e7d15c0e7778ad31afb524d431f547fcbc3b9144cd2bd88ff91ee'
            '7e854e4c972785b8941f60117fbe4b88baeb8d7ca845ef2e10e8064043411da73821ba1ab0068df61e902f242a3ce355b51ffa9eab5397ff3ae3b5defd1be496'
            'ddb1773877fcfd7d9674e63263a80f9dd5a3ba414cda4cc6c411c88d49c1d5175eede66d9362558ddd53c928c723101e4e110479ae88b8aec4d2366ec179297f'
            'aaaa4435a3b6a08bf8e6ad4802afcbf111c1e8f477054251f031b70ae57ac1234fa19048121d64c878dc3b1de03522ce7ef11a263a86dc7062f643d569ecff82'
            '800d62321344ff4e3521ff20fae281cad9206bae80e60965784d144f8bf852f756cbc21f4c9d8d4e93d026da7ca10e0eda7601c83a6d8d85125831eacb907d9a'
            '43d4a066758805597527dbdfc95b4c8ad4b22c5db812b9493e50f8820c72f30c1e431bed40fdb821ab0c23a63aa31dc0e946ab708cc23ac617446964fa6b96f2')

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

