# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=brother-dcp9055cdn
pkgver=1.1.1
pkgrel=6
_pkgrel=5
pkgdesc="Brother CUPS and LPD driver for DCP-9055CDN"
arch=('i686' 'x86_64')
url="http://welcome.solutions.brother.com/bsc/public_s/id/linux/en/download_prn.html#DCP-9055CDN"
license=('custom:Brother' 'GPL')

if [ "$(uname -m)" = "x86_64" ]; then
 depends=('lib32-glibc' 'psutils' 'ghostscript' 'cups')
else
 depends=('psutils' 'ghostscript' 'cups')
fi

source=(http://www.brother.com/pub/bsc/linux/dlf/dcp9055cdnlpr-$pkgver-$_pkgrel.i386.deb
        http://www.brother.com/pub/bsc/linux/dlf/dcp9055cdncupswrapper-$pkgver-$_pkgrel.i386.deb
        brlpdwrapperdcp9055cdn)

md5sums=('f9ffc1a38fcc64e1d7f82d13652a1f57'
         'b08a49bee644dac18229c2843c5349b2'
         '2d368a9cbaeffbc7c9e24bcafe45b71e')

prepare()
{
 mkdir -p $srcdir/unpack || return 1
 for i in $srcdir/*.deb
 do
  cd $srcdir/unpack
  ar -x $i || return 1
  cd $srcdir
  bsdtar -pxf $srcdir/unpack/data.tar.gz || return 1
 done
}

package()
{
 # Mimic deb install
 cp -a $srcdir/usr $pkgdir/ || return 1
 # Install PPD to the standard path so that cups can find it
 install -d -m755 $pkgdir/usr/share/cups/model || return 1
 install -D -m644 $srcdir/usr/local/Brother/Printer/dcp9055cdn/cupswrapper/dcp9055cdn.ppd $pkgdir/usr/share/cups/model || return 1
 # Install tuned cups filter
 install -d -m755 $pkgdir/usr/lib/cups/filter || return 1
 install -D -m755 $srcdir/brlpdwrapperdcp9055cdn $pkgdir/usr/lib/cups/filter || return 1
}
