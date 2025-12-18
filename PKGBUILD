# Maintainer: Christian Hesse <mail@eworm.de>

pkgbase=omnissa-horizon-client
pkgname=(
  'omnissa-horizon-client'
  'omnissa-horizon-file-association'
  'omnissa-horizon-html5mmr'
  'omnissa-horizon-integrated-printing'
  'omnissa-horizon-scanner-client'
  'omnissa-horizon-serialport-client'
  'omnissa-horizon-usb')
pkgver=2512
_build1=8.17.0
_build2=20187591429
_cart="CART26FQ4_LIN_${pkgver}_TARBALL"
pkgrel=3
pkgdesc='Omnissa Horizon Client - connect to Omnissa Horizon virtual desktop'
arch=('x86_64')
makedepends=('resvg' 'oxipng')
options=('!debug')
url='https://customerconnect.omnissa.com/downloads/info/slug/virtual_desktop_and_apps/omnissa_horizon_clients/8'
license=('custom')
source=("${pkgbase}-${pkgver}-${_build1}-${_build2}.tar.gz::https://download3.omnissa.com/software/${_cart}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}.tar.gz"
        'horizon-icon.svg'
        'horizon-usb.service')
sha256sums=('758bcfdd6fed722ab06b3b95bb889bf6007df09509ca473377bb0f0948a1fc4c'
            'ef412bcc6d3e3d45e161861a8fb2abebc1403e7e2d84c52a16552d9091efd5b0'
            '2e9ecddd7cd4d5f65c794065898d3b6ac8e6dd97d05114f7f3775da82263c6d2')

prepare() {
	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	for TARBALL in *.tar.gz; do
		tar xf "${TARBALL}"
	done
}

build() {
	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	# remove 'horizon-client-next', at least for now...
	rm --recursive --force \
		"Omnissa-Horizon-Client-${pkgver}-${_build1}-${_build2}.x64/usr/"{'bin/horizon-client-next','lib/omnissa/horizon/bin/horizon-client-next-bundle/','share/applications/horizon-client-next.desktop'}

	# remove duplicate libraries...
	rm --force \
		"Omnissa-Horizon-PCoIP-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/"lib*.so.*.*.*
	# let's use system libstdc++ from gcc-libs...
	rm --recursive --force \
		"Omnissa-Horizon-PCoIP-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/gcc/"
	# ... and even more system libraries.
	rm --force \
		"Omnissa-Horizon-PCoIP-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/lib"{'ffi.so','fuse.so.2','sigc-2.0.so'{,'.0'},'z.so.1'}
	#    /\    Warning: Removing the mm-libraries (lib*mm.so.*) and openssl
	#   /\7\   (libssl.so.* & libcrypto.so.*) causes segmentation faults...
	#  /_()_\

	# move common files into the client package...
	mv "Omnissa-Horizon-scannerClient-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/horizon/scannerSerialPortCommon/" \
		"Omnissa-Horizon-Client-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/horizon/"
	mv "Omnissa-Horizon-scannerClient-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/rdpvcbridge/" \
		"Omnissa-Horizon-Client-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/"
	rm --recursive --force \
		"Omnissa-Horizon-serialportClient-${pkgver}-${_build1}-${_build2}.x64/usr/lib/omnissa/"{'horizon/scannerSerialPortCommon/','rdpvcbridge'}

	# add a comment to desktop file, use proper icons
	sed -i -e '/Name=/a Comment=Connect to Omnissa Horizon View virtual machines' -e '/^Icon=/c Icon=horizon-client' \
		"Omnissa-Horizon-Client-${pkgver}-${_build1}-${_build2}.x64/usr/share/applications/horizon-client.desktop"

	# prepare high(er) quality icons
	install -d "${srcdir}/icons"
	for SIZE in 16 24 32 48 64 96 128; do
		resvg --height "${SIZE}" --width "${SIZE}" "${srcdir}/horizon-icon.svg" -c | \
			oxipng - > "${srcdir}/icons/horizon-client-${SIZE}.png"
	done
}

package_omnissa-horizon-client() {
	conflicts=('vmware-horizon-client'
	           'vmware-horizon-mmr'
	           'vmware-horizon-pcoip'
	           'vmware-horizon-rtav'
	           'vmware-horizon-smartcard'
	           'vmware-horizon-teams-optimization'
	           'vmware-horizon-tsdr')
	replaces=('vmware-horizon-client'
	          'vmware-horizon-mmr'
	          'vmware-horizon-pcoip'
	          'vmware-horizon-rtav'
	          'vmware-horizon-smartcard'
	          'vmware-horizon-teams-optimization'
	          'vmware-horizon-tsdr')
	depends=('binutils' 'expat' 'fuse2' 'gcc-libs' 'glib2' 'gtk3' 'libffi' 'libsigc++'
	         'libxml2-legacy' 'libxss' 'libxtst' 'zlib')
	optdepends=('alsa-lib: audio support via alsa'
	            'freerdp: RDP remote desktop connections'
	            'libpulse: audio support via pulse sound server'
	            'omnissa-horizon-html5mmr: HTML5 MultiMedia Redirection'
	            'omnissa-horizon-integrated-printing: integrated printing'
	            'omnissa-horizon-scanner-client: scanner client'
	            'omnissa-horizon-serialport-client: serialport client'
	            'omnissa-horizon-usb: USB device redirection'
	            'opensc: Common Access Card (CAC)'
	            'rdesktop: RDP remote desktop connections')
	install=omnissa-horizon-client.install

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-Client-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"
	cp -a "Omnissa-Horizon-PCoIP-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"

	# drop duplicate libraries
	for LIB in 'vaapi2' 'vaapi2.7' 'vdpau'; do
		rm -rf "${pkgdir}/usr/lib/omnissa/horizon/${LIB}"
		ln -s software "${pkgdir}/usr/lib/omnissa/horizon/${LIB}"
	done

	# link for optional dependency opensc
	install -d "${pkgdir}/usr/lib/omnissa/horizon/pkcs11/"
	ln -s '../../../opensc-pkcs11.so' "${pkgdir}/usr/lib/omnissa/horizon/pkcs11/libopenscpkcs11.so"

	# install high(er) quality icons
	install -D -m0644 "${srcdir}/horizon-icon.svg" \
		"${pkgdir}/usr/share/icons/hicolor/scalable/apps/horizon-client.svg"
	for SIZE in 16 24 32 48 64 96 128; do
		install -D -m0644 "${srcdir}/icons/horizon-client-${SIZE}.png" \
			"${pkgdir}/usr/share/icons/hicolor/${SIZE}x${SIZE}/apps/horizon-client.png"
	done
}

package_omnissa-horizon-file-association() {
	pkgdesc='Omnissa Horizon Client - File Association'
	depends=('omnissa-horizon-client')

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-fileAssociation-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"
}

package_omnissa-horizon-html5mmr() {
	pkgdesc='Omnissa Horizon Client - HTML5 MultiMedia Redirection'
	depends=('omnissa-horizon-client')
	conflicts=('vmware-horizon-html5mmr')
	replaces=('vmware-horizon-html5mmr')

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-html5mmr-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"
}

package_omnissa-horizon-integrated-printing() {
	pkgdesc='Omnissa Horizon Client - integrated printing'
	depends=('omnissa-horizon-client' 'libcups' 'zlib')
	conflicts=('vmware-horizon-virtual-printing' 'vmware-horizon-integrated-printing')
	replaces=('vmware-horizon-virtual-printing' 'vmware-horizon-integrated-printing')

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-integratedPrinting-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"
}

package_omnissa-horizon-scanner-client() {
	pkgdesc='Omnissa Horizon Client - scanner client'
	depends=('omnissa-horizon-client')

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-scannerClient-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"
}

package_omnissa-horizon-serialport-client() {
	pkgdesc='Omnissa Horizon Client - serialport client'
	depends=('omnissa-horizon-client' 'libutil-linux' 'zlib' 'glib2')

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-serialportClient-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"
}

package_omnissa-horizon-usb() {
	pkgdesc='Omnissa Horizon Client - USB device redirection'
	depends=('omnissa-horizon-client' 'glib2')
	conflicts=('vmware-horizon-usb')
	replaces=('vmware-horizon-usb')
	install=omnissa-horizon-usb.install

	cd "${srcdir}/Omnissa-Horizon-Client-Linux-${pkgver}-${_build1}-${_build2}/x64/"

	cp -a "Omnissa-Horizon-USB-${pkgver}-${_build1}-${_build2}.x64/usr/" "${pkgdir}/"

	install -D -m0644 "${srcdir}/horizon-usb.service" "${pkgdir}/usr/lib/systemd/system/horizon-usb.service"
}
