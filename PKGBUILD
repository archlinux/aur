# Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-apple-sf-pro'
pkgver=17.0d9e1
pkgrel=1
pkgdesc='Apples San Francisco typeface family. System font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
_file='SF-Pro.dmg'
source=("https://devimages-cdn.apple.com/design/resources/download/$_file"
        'license.awk'
        'version.awk')
sha256sums=('3faf431f1fd5d0da03708ea3ad976585ba63add1e8f031064fedb28398d8c3f3'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd ${srcdir}
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "$_file"
    7z x -y 'SanFranciscoPro/San Francisco Pro.pkg'
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
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
