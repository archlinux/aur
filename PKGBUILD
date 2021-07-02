# Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-apple-sf-compact'
pkgver=17.0d9e1
pkgrel=1
pkgdesc='Apples San Francisco typeface family. watchOS system font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
_file='SF-Compact.dmg'
source=("https://devimages-cdn.apple.com/design/resources/download/$_file"
        'license.awk'
        'version.awk')
sha256sums=('53717dd674248b95b5be96fb622b6faf798f2bb6f97b2aa41aff222729d574f2'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd ${srcdir}
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "$_file"
    7z x -y 'SanFranciscoCompact/San Francisco Compact.pkg'
    7z x -y 'Payload~'

    otfinfo -i Library/Fonts/SF-Compact-Display-Regular.otf | \
        awk -f license.awk > LICENSE
}

pkgver() {
    cd ${srcdir}
    otfinfo -i Library/Fonts/SF-Compact-Display-Regular.otf | \
        awk -f version.awk
}

package() {
    install -Dm655 "${srcdir}"/Library/Fonts/*.otf \
        -t "${pkgdir}/usr/share/fonts/OTF/"
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
