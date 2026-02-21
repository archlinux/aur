# Maintainer: Potato_2565 <p3220928@gmail.com>
# Original Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-apple-sf-compact-fixed'
pkgver=17.0d12e1
pkgrel=1
pkgdesc='Apples San Francisco typeface family. watchOS system font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
_dlfile='SF-Compact.dmg'
_file=${pkgver}-${_dlfile}
source=("$_file::https://devimages-cdn.apple.com/design/resources/download/$_dlfile"
        'license.awk'
        'version.awk')
sha256sums=('4567aae0616dd35afc34bad6bef547e72fd1e65845305a33973064518d1d5348'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            '55a4e9e108e50b07481044fad445636e502f2d95d7e8964e1d4cda3e9618b198')
conflicts=('otf-apple-sf-compact')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd ${srcdir}
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "$_file"
    7z x -y 'SFCompactFonts/SF Compact Fonts.pkg'
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
    install -Dm655 "${srcdir}"/Library/Fonts/*.ttf \
        -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
