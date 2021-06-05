# Maintainer: Jeong Woon Choi (choijeongwoon at gmail)
# based on brother-hll2300d by Mykola Bespaliuk (kolkabes [at] gmail [dot] com)
pkgname=brother-hll2335d
pkgver=4.0.0
_pkgrel=1
pkgrel=1
pkgdesc="Brother HL-L2335D CUPS driver"
url="http://www.brother.com"
arch=('x86_64' 'i686')
depends=('perl' 'bash' 'ghostscript' 'cups')
license=('custom:Brother')
source=(
  "https://download.brother.com/welcome/dlf104134/hll2335dpdrv-${pkgver}-${_pkgrel}.i386.rpm"
  "wrapper.patch"
)
sha512sums=('0b666f130455611c9afb68479b5f53b38fbc8220f04638cfa4bee2306eda3a6bbcf6035636dab3a808dae7d934fbf5c0538d50b9594d8cff5a596b9505be9087'
            'c6d9c28347c1dd153b987226419401750b2f13b9a41da1984a4f895accc746f1e580be1a07a698cf6db3b9f1a649dd028619a7806b6faf3fc3fc5323ea19e147')

if [[ "$CARCH" == "x86_64" ]]; then
	depends+=('lib32-glibc')
fi

package() {
	mkdir -p "${pkgdir}/opt"
	cp -R "${srcdir}/opt/brother" "${pkgdir}/opt/brother"

	cd ${pkgdir}
	patch -Np0 -i "${srcdir}/wrapper.patch"
	cd - 

	cd ${pkgdir}/opt/brother/Printers/HLL2335D/lpd
	for i in brprintconflsr3 rawtobr3; do ln -s ${CARCH}/$i .; done
	cd -
	mkdir -p "${pkgdir}/usr/lib/cups/filter"
	echo "#! /opt/brother/Printers/HLL2335D/cupswrapper/lpdwrapper" > "${srcdir}/filter-shim"
	install -m 0755 -o root -g root "${srcdir}/filter-shim" "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_HLL2335D"

	mkdir -p "${pkgdir}/usr/share/ppd/cupsfilters"
	install -m 0644 -o root -g root "${srcdir}/opt/brother/Printers/HLL2335D/cupswrapper/brother-HLL2335D-cups-en.ppd" "${pkgdir}/usr/share/ppd/cupsfilters"
}

