# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=sdrconnect
pkgver=1.0.9
build=d34bf923c
build_rigcontrol=74fbbe8
pkgrel=1
pkgdesc="SDR receiver for SDRplay devices"
arch=('aarch64' 'x86_64')
url="http://www.sdrplay.com/sdrconnect/"
license=('custom:EULA')
depends=('libusb>=1.0' 'glibc' 'gcc-libs' 'fontconfig' 'freetype2' 'brotli' 'expat'
	 'bzip2' 'libpng' 'harfbuzz' 'graphite' 'pcre2' 'alsa-lib' 'util-linux-libs'
	 'lame' 'hamlib')
# disable stripping symbols and debug package
options=(!strip !debug)
source_x86_64=("https://www.sdrplay.com/software/sdrconnect_linux-x64_${build}.tar.gz"
	       "https://www.sdrplay.com/software/rigcontrol_linux-x64_${build_rigcontrol}.tar.gz")
source_aarch64=("https://www.sdrplay.com/software/sdrconnect_linux-arm64_${build}.tar.gz"
		"https://www.sdrplay.com/software/rigcontrol_linux-arm64_${build_rigcontrol}.tar.gz")
source=("sdrconnect.desktop"
	"rigcontrol.desktop"
	"nrspadministrator.desktop"
	"nrspupdater.desktop"
	"67-sdrplay.rules"
	"sdrconnect.service")
sha256sums=('8324e5e61e08e8fead2d0b5bf9f1926d3013c34f9f550ee41b182c4dcf0dd5a0'
	    '212ed5b5f82c722aa9e4b86cb4248de9f29fdbdd3853dce9dbbd34d8d0486819'
	    'a597f836a5727d5394152545efd2acecb9728a9908572b7e10703f830828a403'
	    '5d85766d4b21846a8e567f15464ea1dbcc475f0881fe813146af19fc4e753cbf'
	    'b39086ca99ef4b2242ff9edef93258c99d478fd37a8ba64319843928e316c61b'
	    '0ac0db2d91ebfe442a80e0f5fb153ec0f93864abf5ae15c6163d9c3abc103498')
sha256sums_aarch64=('81ec345bdc2f2267f03c084930d5a2d2a4ef81ac989e508ba744757f4292488d'
		    'dc355cdce93fe86a2ba8580ba3236de31f76f29c5931a381bc34fa58b4f088fa')
sha256sums_x86_64=('1823fdb01076969cda9475363c41f5e7e2bdf447a2efb063abad68908f47e1b3'
		   'befb242ff4139885d57dadcff058b5459933c14f0e6ef176db804b62f144318f')

package() {
	cd "${srcdir}"

	# These commands are equivalent to the scripts used in the supplied package
	install -D -m644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	(find *.so -type f -exec install -D -m755 "{}" "${pkgdir}/opt/${pkgname}/{}" \;)
	install -D -m755 "SDRconnect" "${pkgdir}/opt/${pkgname}/SDRconnect"
	install -D -m755 "SDRconnect_headless" "${pkgdir}/opt/${pkgname}/SDRconnect_headless"
	install -D -m755 "RigControl" "${pkgdir}/opt/${pkgname}/RigControl"
	install -D -m644 "icons/64x64/sdrconnect.png" "${pkgdir}/usr/share/icons/sdrconnect.png"
	install -D -m644 "icons/64x64/rigcontrol.png" "${pkgdir}/usr/share/icons/rigcontrol.png"
	install -D -m644 "sdrconnect.desktop" "${pkgdir}/usr/share/applications/sdrconnect.desktop"
	install -D -m644 "rigcontrol.desktop" "${pkgdir}/usr/share/applications/rigcontrol.desktop"

	# include NRSP-ST file
	install -D -m755 "NRSPAdministrator" "${pkgdir}/opt/${pkgname}/NRSPAdministrator"
	install -D -m755 "NRSPUpdater" "${pkgdir}/opt/${pkgname}/NRSPUpdater"
	install -D -m644 "icons/64x64/nrspupdater.png" "${pkgdir}/usr/share/icons/nrspupdater.png"
	install -D -m644 "icons/64x64/nrspadministrator.png" "${pkgdir}/usr/share/icons/nrspadministrator.png"
	install -D -m644 "nrspadministrator.desktop" "${pkgdir}/usr/share/applications/nrspadministrator.desktop"
	install -D -m644 "nrspupdater.desktop" "${pkgdir}/usr/share/applications/nrspupdater.desktop"

	# avoid issue with libsdrplay rules
	install -D -m644 67-sdrplay.rules "${pkgdir}/usr/lib/udev/rules.d/67-sdrplay.rules"

	install -m 755 -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname}/SDRconnect" "${pkgdir}/usr/bin/${pkgname}"
	ln -s "/opt/${pkgname}/SDRconnect_headless" "${pkgdir}/usr/bin/${pkgname}-headless"
	ln -s "/opt/${pkgname}/RigControl" "${pkgdir}/usr/bin/rigcontrol"
	ln -s "/opt/${pkgname}/NRSPUpdater" "${pkgdir}/usr/bin/nrsupdater"
	ln -s "/opt/${pkgname}/NRSPAdministrator" "${pkgdir}/usr/bin/nrspadministrator"

	# install the service; should best used as user
	# static server port for the moment
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/system"
	install -D -m644 sdrconnect.service -t "${pkgdir}/usr/lib/systemd/user"
}
