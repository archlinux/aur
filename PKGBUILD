# Maintainer: CupIvan <mail@cupivan.ru>
pkgname=xprinter-ppd
pkgver=1
pkgrel=3
pkgdesc="CUPS driver for Xprinter XP-420B, XP-DT325B, XP-H400B, XP-TT325B series"
url="https://www.xprintertech.com/drivers-2"
arch=('x86_64')
options=('!strip')

source=(
"package.zip::https://www.xprintertech.com/label-printer-1"
)
sha256sums=(
'a846b3104beee9f464e211a25482e4dcaa6b3a9a56f8b684f5a6e1885517f1d3'
)

build() {
	FNAME="Xprinter(label-Linux)"
	tail -n +10 "$FNAME" | tar -xj

	mkdir -p ppd
	for fname in *.ppd
	do
		chmod -x $fname
		gzip -c $fname > ppd/$fname.gz
	done
}

package() {
	install -Dm755 xprinter_64 ${pkgdir}/usr/lib/cups/filter/xprinter
	for path in ./ppd/*
	do
		fname=`basename "$path"`
		install -Dm644 $path "${pkgdir}/usr/share/cups/model/Xprinter/$fname"
	done
}
