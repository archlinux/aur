# Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-apple-sf-mono'
pkgver=16.0d2e1
pkgrel=1
pkgdesc='Apples the San Francisco typeface family. Monospaced variant.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg'
        'license.awk'
        'version.awk')
sha256sums=('f278893e4de119f2b551222cf5ea3167a1a5338699ed939b9908f66689a3f86a'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd ${srcdir}
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y 'SF-Mono.dmg'
    7z x -y 'SFMonoFonts/SF Mono Fonts.pkg'
    7z x -y 'Payload~'

    otfinfo -i Library/Fonts/SF-Mono-BoldItalic.otf | \
        awk -f license.awk > LICENSE
}

pkgver() {
    cd ${srcdir}
    otfinfo -i Library/Fonts/SF-Mono-BoldItalic.otf | \
        awk -f version.awk
}

package() {
    install -Dm655 "${srcdir}"/Library/Fonts/*.otf \
        -t "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
