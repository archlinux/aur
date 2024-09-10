# Maintainer: Leonard Janis König <ljrk@ljrk.org>
# Contributor: witt <1989161762 at qq dot com>

pkgname='otf-apple-sf-mono'
pkgver=18.0d1e1
pkgrel=1
pkgdesc='Apples the San Francisco typeface family. Monospaced variant.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
source=('https://devimages-cdn.apple.com/design/resources/download/SF-Mono.dmg'
        'license.awk'
        'version.awk')
sha256sums=('51aaf1d5328eee0e725415c0c7a6248b4eb9af3ff046e6221cfcf38ba7134e5f'
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
