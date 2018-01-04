# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

pkgname='zijiang-pos58-driver'
pkgver=1.0
pkgrel=2
pkgdesc='Driver for the Zijiang POS58 thermal printer'
arch=('i686' 'x86_64')
url='http://www.zjiang.com/'
license=('custom')
makedepends=('unzip')
depends=()
source=("linux-driver.zip::http://www.zjiang.com/asset/upload/14920711742402.zip")
sha256sums=('8faed310839377a479b62c1285ab3d9601270428e0b362ecd2e7cced02c24d92')

prepare() {
    # Unpack the installer script
    if [ $CARCH == "x86_64" ]; then
        sed -n -e '1,/^exit 0$/!p' Linux*/linux64*/install58 > package.tar.gz
    else
        sed -n -e '1,/^exit 0$/!p' Linux*/linux32*/install58 > package.tar.gz
    fi
    tar zxf "package.tar.gz"
}

package() {
    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    install "${srcdir}/bin/rastertozj58"  "${pkgdir}/usr/lib/cups/filter/"

    mkdir -p "${pkgdir}/usr/share/cups/model/zijiang/"
    install -m0644 "${srcdir}/ppd/POS58.ppd" "${pkgdir}/usr/share/cups/model/zijiang/"
}
