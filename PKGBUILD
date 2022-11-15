# Maintainer: avc <avcsec@protonmail.com>
# based on https://aur.archlinux.org/packages/brother-hll2395dw
pkgname='brother-mfc-b7715dw'
pkgver='4.0.0'
pkgrel=1
pkgdesc='LPR and CUPS driver for the Brother MFC-B7715DW'
url='http://solutions.brother.com/linux/en_us/'
arch=('i686' 'x86_64')
license=('custom:Brother commercial license')
depends=('cups')
depends_x86_64=('lib32-glibc')
source=("https://download.brother.com/welcome/dlf103658/mfcb7715dwpdrv-$pkgver-$pkgrel.i386.rpm")
sha256sums=('c89cebb555a505d5285f58e6b361ef76a837aa839cdc4161ab6c755745f6907c')

package() {
	_model="MFCB7715DW"

	mkdir -p "$pkgdir/usr/share"
	cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/cupswrapper/lpdwrapper"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/$_model/lpd/lpdfilter"

	find "$pkgdir" -type f -name 'setupPrintcap*' -delete

	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/usr/share/brother/Printers/$_model/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_$_model"

	install -d "$pkgdir/usr/share/cups/model/"
	ln -s "/usr/share/brother/Printers/$_model/cupswrapper/brother-$_model-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

	ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
	ln -s "/usr/share/brother/Printers/$_model/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"

	ln -s "/usr/share/brother/Printers/$_model/inf" "$pkgdir/usr/share/brother/Printers/$_model/lpd/"
}

