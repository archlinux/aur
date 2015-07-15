# Contributor: Pavel Benak <pavel.benak@uhk.cz>

pkgname=brother-dcp9010cn
pkgver=1.1.2
pkgrel=2
_cupsrel=2
_lprrel=1
pkgdesc="Brother cups and lpd driver for DCP-9010CN"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/index.html"
license=('custom')mm
if [ "$(uname -m)" = "x86_64" ]
then
 depends=('lib32-glibc' 'psutils')
else
 depends=('psutils')
fi
noextract=(DCP7010.ppd.gz)

source=(
http://www.brother.com/pub/bsc/linux/dlf/dcp9010cncupswrapper-$pkgver-$_cupsrel.i386.deb
http://www.brother.com/pub/bsc/linux/dlf/dcp9010cnlpr-$pkgver-$_lprrel.i386.deb
brlpdwrapperdcp9010cn
)

md5sums=('77656611e482dd30e2421872b94ebd73'
         '2bb1422ba9d9e5e4581ea4cbbe770fc9'
         '252f0b1fdff5afc395de5a59a1d9641f')

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
 cp -a $srcdir/usr $pkgdir/ || return 1
 cp -a $srcdir/opt $pkgdir/ || return 1

 # PPD file
 install -d -m755 $pkgdir/usr/share/cups/model || return 1
 install -D -m644 $srcdir/opt/brother/Printers/dcp9010cn/cupswrapper/brother_dcp9010cn_printer_en.ppd $pkgdir/usr/share/cups/model || return 1

 # cups wrapper
 install -d -m755 $pkgdir/usr/lib/cups/filter || return 1
 install -D -m755 brlpdwrapperdcp9010cn $pkgdir/usr/lib/cups/filter || return 1
}
