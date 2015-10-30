# Maintainer: Chris <alostengineer at narmos org>
# Contributor: Olivier EBLE <olivier.eble at gmail com>
# Contributor: Laszlo Papp <djszapi2 at gmail com>
pkgname=libftd2xx
pkgver=1.3.6
pkgrel=1
pkgdesc="Library that allows a direct access to a USB FTDI2XX chip based device"
arch=('i686' 'x86_64')
url="http://www.ftdichip.com/"
license=('GPL')
depends=('glibc' 'libusbx>=1.0.8')

# Keep static lib
options=(!strip staticlibs)

# Separate packages for each architecture
if [ "${CARCH}" == "i686" ]; then
	source=(http://www.ftdichip.com/Drivers/D2XX/Linux/${pkgname}-i386-${pkgver}.tgz
        	55-ft2232.rules)
	md5sums=('e75bfff2387af14a5ca0904d311a592a'
	         '5c6d646c3c5b28db1c3b880a04d4d79c')
else
	source=(http://www.ftdichip.com/Drivers/D2XX/Linux/${pkgname}-x86_64-${pkgver}.tgz
        	55-ft2232.rules)
	md5sums=('ef66927b5e9748c08b46ab7d7124b764'
	         '5c6d646c3c5b28db1c3b880a04d4d79c')
fi

package() {
	# Make required dirs
	mkdir -p ${pkgdir}/usr/{lib,include}

	# Install versioned so file as well as static library
	install -Dm755 ${srcdir}/release/build/${pkgname}.so.${pkgver} ${pkgdir}/usr/lib/${pkgname}.so.${pkgver}
	install -m644 ${srcdir}/release/build/${pkgname}.a ${pkgdir}/usr/lib/${pkgname}.a

	# Link versioned so file to generic
  	ln -sf /usr/lib/${pkgname}.so.${pkgver} "${pkgdir}"/usr/lib/${pkgname}.so
  
  
  	# Install Headers
	install -m644 "${srcdir}"/release/{ftd2xx,WinTypes}.h "${pkgdir}"/usr/include/

	# Install udev rules
	install -D -m755 "${srcdir}"/55-ft2232.rules "${pkgdir}"/etc/udev/rules.d/55-ft2232.rules
}
