# Maintainer: SunParis <p1108sun@hotmail.com>

pkgname=ffuosprint-bin
pkgver=1.0.1.7
pkgrel=1
_debrel=1
pkgdesc='FUJIFILM Printer Driver for UOS'
arch=('x86_64')
url='https://m3support-fb.fujifilm-fb.com.cn/driver_downloads/www/'
license=('LicenseRef-FUJIFILM-custom')
depends=('cups' 'glibc' 'libcups')
conflicts=('ffuosprint')
provides=('ffuosprint')
backup=('etc/cups/mimeff.convs' 'etc/cups/mimeff.types')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("https://m3support-fb.fujifilm-fb.com.cn/driver_downloads/signed_ffuosprint_${pkgver}-${_debrel}_amd64.deb.zip")
sha256sums=('a1ae897aec62cadbe8621622cce06a1bf962c9a23bf47649e3c1636cf5f7287f')

package() {
    local deb="signed_ffuosprint_${pkgver}-${_debrel}_amd64.deb/signed_ffuosprint_${pkgver}-${_debrel}_amd64.deb"

    bsdtar -xf "$deb" data.tar.xz
    bsdtar -C "$pkgdir" -xf data.tar.xz

    install -d "$pkgdir/usr/lib/ffuosprint"
    mv "$pkgdir"/opt/fujifilm/PDFDriver/bin/* "$pkgdir/usr/lib/ffuosprint/"
    rm -rf "$pkgdir/opt"

    install -d "$pkgdir/usr/lib/cups/filter"
    ln -s /usr/lib/ffuosprint/pdftopdfff "$pkgdir/usr/lib/cups/filter/pdftopdfff"
    ln -s /usr/lib/ffuosprint/pdftopjlff "$pkgdir/usr/lib/cups/filter/pdftopjlff"
    ln -s /usr/lib/ffuosprint/pstopdfff "$pkgdir/usr/lib/cups/filter/pstopdfff"

    install -Dm644 "$pkgdir/usr/share/doc/ffuosprint/copyright" \
        "$pkgdir/usr/share/licenses/$pkgname/copyright"
}
