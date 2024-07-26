pkgname='ricoh-sp210-211-ppd'
pkgver='0.1'
pkgrel=1

pkgdesc="CUPS driver for Ricoh SP210 and 211"
arch=('i686' 'x86_64')
url="https://support.ricoh.com/bb/html/dr_ut_e/re1/model/sp210/sp210.htm"
license=('unknown')

depends=('cups' 'ghostscript')
# `binutils` for extracting the .deb file using `ar`
# `tar` for extracting data
# `glibc` for deciding cpu architecture using `getconf`
makedepends=('binutils' 'tar' 'glibc')

source=('git+https://github.com/droidzone/ricohsp210')
sha256sums=('SKIP')

prepare() {
	cd ricohsp210
	ar x 'SP-210211-series-Printer-0.03.deb'
	tar -zxf data.tar.gz
}

package() {
	filter_path='/usr/lib/cups/filter'
	raster_name='rastertolilo'
	platform=$(getconf LONG_BIT)

	install -d "$pkgdir/usr"
	cp -a "$srcdir/ricohsp210/usr" "$pkgdir"

if [ "$platform" = "64" ]; then
	cp "$srcdir/ricohsp210/tmp/x86_64/$raster_name" "$pkgdir/$filter_path/$raster_name"
fi

	chown root:root "$pkgdir/$filter_path/$raster_name"
	chmod 755 "$pkgdir/$filter_path/$raster_name"
}
