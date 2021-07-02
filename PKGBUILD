# Maintainer: Leonard Janis König <ljrk@ljrk.org>

pkgname='otf-apple-sf-arabic'
pkgver=17.0d8e2
pkgrel=1
pkgdesc='Apples San Francisco typeface family. Arabic font.'
arch=('any')
url='https://developer.apple.com/fonts/'
license=('custom:apple-restricted-font')
_file='SF-Arabic.dmg'
source=("https://devimages-cdn.apple.com/design/resources/download/$_file"
        'license.awk'
        'version.awk')
sha256sums=('5b28d2c7ec5573375aa5e4ac5c4b3c48aad86f48a559af96e848b448422abb12'
            'cd45a6edaa3829837b090a5a18d3c906816931e7a779b33b6ada23b49b5a5889'
            'cc3460cf67bde420b2b43f26d80ff4d98bd64b9f65e7c66856d7422ffbcd0945')
makedepends=('texlive-bin' 'p7zip')

prepare() {
    cd ${srcdir}
    # These are dmg images, xar and cpio archives.  Just use 7z.
    7z x -y "$_file"
    7z x -y 'SFArabicFonts/SF Arabic Fonts.pkg'
    7z x -y 'Payload~'

    otfinfo -i Library/Fonts/SF-Arabic.ttf | \
        awk -f license.awk > LICENSE
}

pkgver() {
    cd ${srcdir}
    otfinfo -i Library/Fonts/SF-Arabic.ttf | \
        awk -f version.awk
}

package() {
    install -Dm655 "${srcdir}"/Library/Fonts/*.ttf \
        -t "${pkgdir}/usr/share/fonts/TTF/"
    install -Dm644 LICENSE \
        "${pkgdir}"/usr/share/licenses/${pkgname}/AppleFontLicense
}
