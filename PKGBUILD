# Maintainer: EEEntity <eeentity at hotmail dot com>

pkgname='otf-apple-sf-pro'
pkgver=22.0d5e4
pkgrel=1
pkgdesc='Apples San Francisco typeface family. System font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
source=("${pkgname}-${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
        'license.awk'
        'version.awk')
sha256sums=('968ab3b8b1f92c2d8af61eb0680f5c2224c4e78d59b986bf004502a7fc012918'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')
options=(!debug)
prepare() {
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "${pkgname}-${pkgver}.dmg" > /dev/null
    7z x -y 'SFProFonts.pkg' > /dev/null
    7z x -y 'SFProFontsPackage.pkg/Payload' > /dev/null
    7z x -y 'Payload~' > /dev/null

    otfinfo -i Library/Fonts/SF-Pro-Display-BoldItalic.otf | \
        awk -f license.awk > LICENSE
}

package() {
    install -Dm655 "${srcdir}"/Library/Fonts/*.otf \
        -t "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm655 "${srcdir}"/Library/Fonts/*.ttf \
        -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/AppleFontLicense"
}
