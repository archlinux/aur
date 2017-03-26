# Maintainer: parchd <parchd at archlinux.info>

pkgname="brother-dcp-9020cdw"
pkgver="1.1.4"
pkgrel=2
pkgdesc="CUPS driver for the Brother DCP-9020CDW"
url="http://support.brother.com/g/b/producttop.aspx?c=gb&lang=en&prod=dcp9020cdw_eu"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('cups' 'psutils')
depends_x86_64=('lib32-glibc')
makedepends=('libarchive')
source=(
    'http://download.brother.com/welcome/dlf100444/dcp9020cdw_cupswrapper_GPL_source_1.1.4-0.tar.gz'
    'http://www.brother.com/pub/bsc/linux/dlf/dcp9020cdwlpr-1.1.2-1.i386.deb'
)
sha512sums=(
    '090aa66700dc860712fac645dde5289d316e35b4a68a5d0da0261dc17276e04cc611d57b518e6d778a8f6033a9a0ad77bb4f506d24063149f1060a75b0b2e3ea'
    '17d0934adca787fef15a0a985a6a895f4e1163bf3a4408bba0f6a6c8b324f9b3efcba1d25057050027caac3c545af4c8348d3586468f32d8594f0b098b67f3fb'
)

prepare(){
    cd $srcdir
    sed -ne '21,26p' -ne '26 a cat << !ENDOFWFILTER!' -ne '110,262p' "dcp9020cdw_cupswrapper_GPL_source_$pkgver-0/cupswrapper/cupswrapperdcp9020cdw" > create_lpdwrapper.sh
}

build(){
    cd "$srcdir/dcp9020cdw_cupswrapper_GPL_source_$pkgver-0/brcupsconfig"
    make

    cd $srcdir
    sh create_lpdwrapper.sh > brother_lpdwrapper_dcp9020cdw
}

package(){
    cd $pkgdir
    bsdtar -xf "$srcdir/data.tar.gz"
    install -Dm755 "$srcdir/dcp9020cdw_cupswrapper_GPL_source_$pkgver-0/brcupsconfig/brcupsconfpt1" opt/brother/Printers/dcp9020cdw/cupswrapper/brcupsconfpt1
    install -Dm644 "$srcdir/dcp9020cdw_cupswrapper_GPL_source_$pkgver-0/PPD/brother_dcp9020cdw_printer_en.ppd" usr/share/cups/model/Brother/brother_dcp9020cdw_printer_en.ppd
    install -Dm644 "$srcdir/dcp9020cdw_cupswrapper_GPL_source_$pkgver-0/PPD/brother_dcp9020cdw_printer_en.ppd" usr/share/ppd/Brother/brother_dcp9020cdw_printer_en.ppd
    install -Dm755 "$srcdir/brother_lpdwrapper_dcp9020cdw" usr/lib/cups/filter/brother_lpdwrapper_dcp9020cdw

}
