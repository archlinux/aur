# Maintainer: SecureCRT <securecrt@sina.com>
# Based on brother-dcpl2550dw package from AUR.

pkgname=brother-dcp7090dw
pkgver=4.0.0_1
pkgrel=1
pkgdesc="Brother DCP-7090DW lpr driver and CUPS wrapper."
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/downloadend.aspx?c=cn_ot&lang=en&prod=dcp7090dw_cn&os=127&dlid=dlf105153_000&flang=4&type3=10282"
license=('GPL2' 'custom:brother')
_model="DCP7090DW"
depends=('cups')
optdepends=('brscan4: scanner support.')
source=("https://download.brother.com/welcome/dlf105153/dcp7090dwpdrv-${pkgver/_/-}.i386.rpm")
md5sums=('17d13b1c8dc9c526add362e355e59372')

if test "$CARCH" == x86_64; then
  depends+=('lib32-glibc')
fi

package() {
	# Using /usr/share instead of /opt
	mkdir -p "$pkgdir/usr/share"
	# delete armv7l files
	rm -rf "$srcdir/opt/brother/Printers/${_model}/lpd/armv7l"
	
	cp -R "$srcdir/opt/brother" "$pkgdir/usr/share"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper"
	sed -i 's|\\\/opt\\\/|\\\/usr\\\/|' "$pkgdir/usr/share/brother/Printers/${_model}/lpd/lpdfilter"

	# symlink for lpdwrapper so it correctly figures out the printer model from the path
	install -d "$pkgdir/usr/lib/cups/filter/"
	ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/lpdwrapper" "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_${_model}"

	# symlink for the PPD
	install -d "$pkgdir/usr/share/cups/model/"
	ln -s "/usr/share/brother/Printers/${_model}/cupswrapper/brother-${_model}-cups-en.ppd" "$pkgdir/usr/share/cups/model/"

	# a couple architecture-specific symlinks
	ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/brprintconflsr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
	ln -s "/usr/share/brother/Printers/${_model}/lpd/$CARCH/rawtobr3" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"

	# symlink for inf because it tries to execute it there
	ln -s "/usr/share/brother/Printers/${_model}/inf" "$pkgdir/usr/share/brother/Printers/${_model}/lpd/"
}

