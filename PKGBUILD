# Maintainer: Joshua Jameson <josh@netquirk.com>
pkgname=xprinter-cups
pkgver=1
pkgrel=1
pkgdesc="Xprinter Drivers for Linux"
url="https://www.xprintertech.com/drivers-2"
arch=('x86_64')
options=('!strip')
makedepends=('dpkg')

source=(
"package.rar::https://img5541.weyesimg.com/uploads/xprintertech.com/addon/17140160081487.rar"
)
sha256sums=(
'ed2665af416d83b8622f3f231a7300632251ec4fa98804b675e123e052518cfa'
)

build() {
	find .
	dpkg -x ./Linux/printer-driver-xprinter_3.13.3_all.deb .
	find .
	
	mkdir -p ppd
	for fname in ./usr/share/cups/model/xprinter/*.ppd
	do
		echo ADD $fname
		chmod -x "$fname"
		fname2=`basename "$fname"`
		gzip -c "$fname" > "./ppd/$fname2.gz"
	done
}

package() {
	install -Dm755 ./opt/xprinter/printer-driver-xprinter/bin/rastertosnailtspl-x64 ${pkgdir}/usr/lib/cups/filter/rastertosnailtspl-xprinter

	for path in ./ppd/*
	do
		fname=`basename "$path"`
		install -Dm644 "$path" "${pkgdir}/usr/share/cups/model/xprinter/$fname"
	done
}
