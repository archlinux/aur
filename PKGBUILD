# Maintainer: witt <1989161762 at qq dot com>

pkgname='otf-apple-sf-pro'
pkgver=20.0d8e1
pkgrel=1
pkgdesc='Apples San Francisco typeface family. System font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
source=("${pkgname}-${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
        'license.awk'
        'version.awk')
sha256sums=('07cc658c102a3a84455ef48e90e2830d679851e6ed32640b27c945d398859d79'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd "${srcdir}"
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "${pkgname}-${pkgver}.dmg"
    7z x -y 'SFProFonts/SF Pro Fonts.pkg'
    7z x -y 'Payload~'

    otfinfo -i Library/Fonts/SF-Pro-Display-BoldItalic.otf | \
        awk -f license.awk > LICENSE
}

pkgver() {
    cd ${srcdir}
    otfinfo -i Library/Fonts/SF-Pro-Display-BoldItalic.otf | \
        awk -f version.awk
}

package() {
    install -Dm655 "${srcdir}"/Library/Fonts/*.otf \
        -t "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm655 "${srcdir}"/Library/Fonts/*.ttf \
        -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
