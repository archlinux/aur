# Maintainer: libook <libook7@gmail.com>
# Contributor: parchd <parchd at archlinux.info>

pkgname="brother-dcp-9020cdn"
pkgver="1.1.4"
pkgrel=2
pkgdesc="CUPS driver for the Brother DCP-9020CDN"
url="https://support.brother.com/g/b/downloadendbranch.aspx?c=cn&lang=zh&dlid=dlf102671_000&type3=560&dlang=1&branch=bcn&prod=dcp9020cdn_us_cn&os=127&flang=9"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('cups' 'psutils')
depends_x86_64=('lib32-glibc')
makedepends=('libarchive')
source=(
    'https://d.brother-movie.com/DCP9020CDN/dcp9020cdn_cupswrapper_GPL_source_1.1.4-0.tar.gz'
    'https://d.brother-movie.com/DCP9020CDN/dcp9020cdnlpr-1.1.2-1.i386.deb'
)
sha512sums=(
    '4b5b99477f0b359f42937eae887021a23294a42d1ecfd01ee3416f46581b26c91d7f83e1e3f5e27d1ccb4b628816787ea6fb9807d41986ac1d3298d3cde96d54'
    '91525e9fca5f7d04a417625708112176c2495f0f56c14480d446e9459dfd6c322ee1610739b1fcf7e6989a0c380e4b8422e8c41565bf456e16674d3ef50485c5'
)

prepare(){
    cd $srcdir
    sed -ne '21,26p' -ne '26 a cat << !ENDOFWFILTER!' -ne '110,262p' "dcp9020cdn_cupswrapper_GPL_source_$pkgver-0/cupswrapper/cupswrapperdcp9020cdn" > create_lpdwrapper.sh
}

build(){
    cd "$srcdir/dcp9020cdn_cupswrapper_GPL_source_$pkgver-0/brcupsconfig"
    make

    cd $srcdir
    sh create_lpdwrapper.sh > brother_lpdwrapper_dcp9020cdn
}

package(){
    cd $pkgdir
    bsdtar -xf "$srcdir/data.tar.gz"
    install -Dm755 "$srcdir/dcp9020cdn_cupswrapper_GPL_source_$pkgver-0/brcupsconfig/brcupsconfpt1" opt/brother/Printers/dcp9020cdn/cupswrapper/brcupsconfpt1
    install -Dm644 "$srcdir/dcp9020cdn_cupswrapper_GPL_source_$pkgver-0/PPD/brother_dcp9020cdn_printer_en.ppd" usr/share/cups/model/Brother/brother_dcp9020cdn_printer_en.ppd
    install -Dm644 "$srcdir/dcp9020cdn_cupswrapper_GPL_source_$pkgver-0/PPD/brother_dcp9020cdn_printer_en.ppd" usr/share/ppd/Brother/brother_dcp9020cdn_printer_en.ppd
    install -Dm755 "$srcdir/brother_lpdwrapper_dcp9020cdn" usr/lib/cups/filter/brother_lpdwrapper_dcp9020cdn

}
