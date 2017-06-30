# Maintainer: juanmafont <juanmafont at gmail.com>

pkgname="brother-dcp-9015cdw"
pkgver="1.1.4"
pkgrel=2
pkgdesc="CUPS driver for the Brother DCP-9015CDW"
url="http://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcp9015cdw_eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('cups' 'psutils')
depends_x86_64=('lib32-glibc')
makedepends=('libarchive')
source=(
    'http://download.brother.com/welcome/dlf102116/dcp9015cdw_cupswrapper_GPL_source_1.1.4-0.tar.gz'
    'http://download.brother.com/welcome/dlf102113/dcp9015cdwlpr-1.1.3-0.i386.deb'
)
sha512sums=(
    '194767b03141707b23588b4af22d53766adcbecd73877f533af81f0fa3a044b5a03c50f54765b2dc3d5d3dc64c5a4364b92d84a76f0cd113424c4db9fd9c6c53'
    'c19763bece12b89a46743cb2aac6214ef1496923c219b02adba91be874d176314dff19aaf06e52ebd73ee85677a23977cc861d0a2d5ec4b0932ff4cef6c9b828'
)

prepare(){
    cd $srcdir
    sed -ne '21,26p' -ne '26 a cat << !ENDOFWFILTER!' -ne '110,262p' "dcp9015cdw_cupswrapper_GPL_source_$pkgver-0/cupswrapper/cupswrapperdcp9015cdw" > create_lpdwrapper.sh
}

build(){
    cd "$srcdir/dcp9015cdw_cupswrapper_GPL_source_$pkgver-0/brcupsconfig"
    make

    cd $srcdir
    sh create_lpdwrapper.sh > brother_lpdwrapper_dcp9015cdw
}

package(){
    cd $pkgdir
    bsdtar -xf "$srcdir/data.tar.gz"
    install -Dm755 "$srcdir/dcp9015cdw_cupswrapper_GPL_source_$pkgver-0/brcupsconfig/brcupsconfpt1" opt/brother/Printers/dcp9015cdw/cupswrapper/brcupsconfpt1
    install -Dm644 "$srcdir/dcp9015cdw_cupswrapper_GPL_source_$pkgver-0/PPD/brother_dcp9015cdw_printer_en.ppd" usr/share/cups/model/Brother/brother_dcp9015cdw_printer_en.ppd
    install -Dm644 "$srcdir/dcp9015cdw_cupswrapper_GPL_source_$pkgver-0/PPD/brother_dcp9015cdw_printer_en.ppd" usr/share/ppd/Brother/brother_dcp9015cdw_printer_en.ppd
    install -Dm755 "$srcdir/brother_lpdwrapper_dcp9015cdw" usr/lib/cups/filter/brother_lpdwrapper_dcp9015cdw

}
