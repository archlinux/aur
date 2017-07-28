# Maintainer: mox <mox at uni-hd de>
# Based on libftd2xx maintained by Chris <alostengineer at narmos org> et al.
pkgname=libftd3xx
pkgver=0.5.0
pkgrel=1
pkgdesc="Library that allows a direct access to a FTDI USB3.0 chip (FT60x) based device. Proprietary FTDI drivers BETA."
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('custom')
depends=('glibc' 'libusbx>=1.0.8')

# Keep static lib
options=(!strip staticlibs)

# Separate packages for each architecture
if [ "${CARCH}" == "i686" ]; then
	source=(http://www.ftdichip.com/Drivers/D3XX/Linux/d3xx-linux-i686-${pkgver}.tar.zip
        	http://www.ftdichip.com/Drivers/FTDriverLicenceTerms.htm)
	md5sums=('2499a88f1d1c18d10e89c0e3cc000eb1'
	         '5aa57df28165cb16ffdf2f2989417841')
else
	source=(http://www.ftdichip.com/Drivers/D3XX/Linux/d3xx-linux-x86_64-${pkgver}.tar.zip
        	http://www.ftdichip.com/Drivers/FTDriverLicenceTerms.htm)
	md5sums=('ff272a3e2781313d2adbef78b37e00ec'
	         '5aa57df28165cb16ffdf2f2989417841')
fi

prepare() {
	echo "Extracting the inner package"
	tar xf d3xx-linux-${CARCH}-${pkgver}.tar.bz2
}

package() {
	# Make required dirs
	mkdir -p ${pkgdir}/usr/{lib,include}
	mkdir -p ${pkgdir}/usr/share/licenses/$pkgname
	mkdir -p ${pkgdir}/etc/udev/rules.d

	# Install versioned so file as well as static library
	install -Dm755 ${srcdir}/linux-${CARCH}/${pkgname}.so ${pkgdir}/usr/lib/${pkgname}.so.${pkgver}
	install -m644 ${srcdir}/linux-${CARCH}/${pkgname}.a ${pkgdir}/usr/lib/${pkgname}.a

	# Link versioned so file to generic
  	ln -sf /usr/lib/${pkgname}.so.${pkgver} "${pkgdir}"/usr/lib/${pkgname}.so

  	# Install Headers
	install -m644 "${srcdir}"/linux-${CARCH}/ftd3xx.h "${pkgdir}"/usr/include/

	# Install udev rules
	install -D -m755 "${srcdir}"/linux-${CARCH}/51-ftd3xx.rules "${pkgdir}"/etc/udev/rules.d/51-ftd3xx.rules

	# Install the license
	install -Dm644 "${srcdir}"/FTDriverLicenceTerms.htm "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.htm
}
