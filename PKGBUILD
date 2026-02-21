# Maintainer: EEEntity <eeentity at 163 dot com>

pkgname='otf-apple-sf-pro'
pkgver=21.0d6e2
pkgrel=1
pkgdesc='Apples San Francisco typeface family. System font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
source=("${pkgname}-${pkgver}.dmg::https://devimages-cdn.apple.com/design/resources/download/SF-Pro.dmg"
        'license.awk'
        'version.awk')
sha256sums=('2e4d7853988b734dc1af33b921d8d4c0e4400eac312924a0eab4b73a51fd69ae'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')
options=(!debug)
prepare() {
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "${pkgname}-${pkgver}.dmg" > /dev/null
    7z x -y 'SFProFonts/SF Pro Fonts.pkg' > /dev/null
    7z x -y 'SFProFonts.pkg/Payload' > /dev/null
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
