# Maintainer: Benedykt 'b3niup' Przybyło <b3niup@gmail.com>
# based on brother-hll2300d by Mykola Bespaliuk (kolkabes [at] gmail [dot] com)
pkgname=brother-hll2310d
pkgver=4.0.0
_pkgrel=1
pkgrel=2
pkgdesc="Brother HL-L2310D CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash' 'ghostscript' 'which')
license=('custom:Brother')
source=(
	"https://download.brother.com/welcome/dlf103531/hll2310dpdrv-${pkgver}-${_pkgrel}.i386.rpm"
	"wrapper.patch"
)
md5sums=(
	'786ededd9b19d559dcb49160bb81c8a2'
	'7e4c0e3834def252fc58f0dcdad7cbb2'
)

if [[ "$CARCH" == "x86_64" ]]; then
	depends+=('lib32-glibc')
fi

package() {
	mkdir -p "${pkgdir}/opt"
	cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

	cd ${pkgdir}
	patch -Np0 -i "${srcdir}/wrapper.patch"
	cd - 

	cd ${pkgdir}/opt/brother/Printers/HLL2310D/lpd
	for i in brprintconflsr3 rawtobr3; do ln -s ${CARCH}/$i .; done
	cd -
	mkdir -p "${pkgdir}/usr/lib/cups/filter"
	echo "#! /opt/brother/Printers/HLL2310D/cupswrapper/lpdwrapper" > "${srcdir}/filter-shim"
	install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HLL2310D"

	mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
	install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/HLL2310D/cupswrapper/brother-HLL2310D-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}

