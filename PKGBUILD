# Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-apple-ny'
pkgver=16.0d2e2
pkgrel=1
pkgdesc='Apples New York typeface family. For usage alongside SF.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
source=('https://devimages-cdn.apple.com/design/resources/download/NY-Font.dmg'
        'license.awk'
        'version.awk')
sha256sums=('58058b5dbddb77eec84a0c0b10b41fc544bc7cd50c6cb49874da4197f91afde5'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd ${srcdir}
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y 'NY-Font.dmg'
    7z x -y 'NYFonts/NY Fonts.pkg'
    7z x -y 'Payload~'

    otfinfo -i Library/Fonts/NewYorkMedium-Regular.otf | \
        awk -f license.awk > LICENSE
}

pkgver() {
    cd ${srcdir}
    otfinfo -i Library/Fonts/NewYorkMedium-Regular.otf | \
        awk -f version.awk
}

package() {
    install -Dm655 "${srcdir}"/Library/Fonts/*.otf \
        -t "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
