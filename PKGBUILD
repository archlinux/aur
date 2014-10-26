# Maintainer: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Alexander Conway <alexconway12 [at] gmail [dot] com>

pkgbase=logger-pro-beta
pkgname=('logger-pro-beta' 'logger-pro-drivers-beta')
_pkgver=('3.8.4.6' '1.5.1.1')
pkgver=3846
pkgrel=1
epoch=1
pkgdesc="Logger Pro for Linux Public Beta from Vernier Software"
arch=('i686' 'x86_64')
url='http://www.vernier.com/downloads/logger-pro-linux/'
license=('unknown')
options=(!strip)

# So we can access the overall version inside package_*() functions.
_buildnum="$pkgver"

if [ "$CARCH" = 'i686' ] ; then
	_archbits="32"
	_archname="i386"
	sha256sums=('d405e1a2135c0b3fd3a0893ef32ff66f2e446a37f8a8d4d0aa184538a3b1cfb4')
elif [ "$CARCH" = 'x86_64' ] ; then
	_archbits="64"
	_archname="amd64"
	sha256sums=('bdbec10d6f48723c16f1792b7c049660cfff61ec438dc057018da29350cfbcb5')
fi

source=("http://www.vernier.com/files/downloads/LPL-${_buildnum}-${_archbits}.tar.gz"
        "wrapper.sh")

sha256sums+=('b195e4d410643d19095dfaa5dc3810c9f18b8fb59a2191853a47a2fa701406b4')

# _extract_deb
# Extract a .deb file into the geivn folder.
#
# Parameters:
#   $1: The path to the .deb file to extract.
#   $2: The name of the folder to extract to (will be created).
_extract_deb() {
	# Extract the debian package
	mkdir -p "${2}-debcontents"
	bsdtar -xf "$1" -C "${2}-debcontents"

	# Extract the actual files
	mkdir -p "${2}"
	bsdtar -xf "${2}-debcontents/data.tar.xz" -C "${2}"
}

prepare() {
	cd "${srcdir}"

	mkdir -p "${pkgbase}-${_buildnum}"
	_extract_deb "vstloggerpro_${_pkgver[0]}_${_archname}.deb" "${pkgbase}-${_buildnum}/${pkgname[0]}"
	_extract_deb "vstdrivers_${_pkgver[1]}_${_archname}.deb" "${pkgbase}-${_buildnum}/${pkgname[1]}"
}

package_logger-pro-beta() {
	pkgver="${_pkgver[0]}"
	pkgrel=1
	depends=("${pkgname[1]}" 'gtkmm' 'libusb' 'desktop-file-utils' 'hicolor-icon-theme' 'gtk-update-icon-cache')
	provides=('logger-pro')
	conflicts=('logger-pro')
	install='logger-pro.install'

	cd "${srcdir}/${pkgbase}-${_buildnum}/${pkgname[0]}"

	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/bin"

	cp -dpr --no-preserve=ownership usr/local/share/{LoggerPro,applications,icons} "${pkgdir}/usr/share/"
	cp -dpr --no-preserve=ownership usr/share/* "${pkgdir}/usr/share/"

	chmod a+rwx "${pkgdir}/usr/share/LoggerPro/Linux/tmp"
	chmod a+rwx "${pkgdir}/usr/share/LoggerPro/Linux/VSTSupport"

	install -Dm755 usr/local/bin/loggerpro "${pkgdir}/usr/bin/loggerpro_real"
	install -Dm755 "${srcdir}/wrapper.sh" "${pkgdir}/usr/bin/loggerpro"
}

package_logger-pro-drivers-beta() {
	pkgver="${_pkgver[1]}"
	pkgrel=1
	depends=('glib2' 'alsa-lib')
	pkgdesc="${pkgdesc} (drivers)"
	provides=('logger-pro-drivers')
	conflicts=('logger-pro-drivers')

	cd "${srcdir}/${pkgbase}-${_buildnum}/${pkgname[1]}"

	mkdir -p "${pkgdir}/usr/share"
	mkdir -p "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d"

	cp -dpr --no-preserve=ownership usr/share/* "${pkgdir}/usr/share/"
	cp -dpr --no-preserve=ownership usr/lib/* "${pkgdir}/usr/lib/"

	install -Dm644 etc/udev/rules.d/vstlibusb.rules "${pkgdir}/usr/lib/udev/rules.d/vstlibusb.rules"
}
