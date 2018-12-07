# Maintainer: Dan McCurry <dan.mc at protonmail dot com>
#
# You must provide the password for the software in order to extract and install
# it:
ooi_password=
#
pkgname=spectrasuite
pkgver=2.0.162
pkgrel=1
pkgdesc="Spectrometer operating software for Ocean Optics spectrometers.
(discontinued by manufacturer)"
arch=('x86_64' 'i686')
url="https://oceanoptics.com"
license=('custom')
depends=('libxp'
	'libxtst'
	'libusb-compat'
	'lib32-libglvnd'
	'libxt'
	'java-runtime'
	'libnet'
	'alsa-lib')
depends_x86_64=('lib32-libglvnd')
depends_i686=('libglvnd')
source_x86_64=("http://files.oceanoptics.com/downloads/SpectraSuite/SpectraSuiteSetup_Linux64.bin")
source_i686=("http://files.oceanoptics.com/downloads/SpectraSuite/SpectraSuiteSetup_Linux32.bin")
md5sums_x86_64=('83937d114944d638f535d3a144773d43')
md5sums_i686=('af233c40fde1cfb903b52443883d89d1')

prepare() {
	if [ -z ${ooi_password} ]; then
		error "You must provide the password for the installer in the PKGBUILD."
		exit 1
	fi

	cd "$srcdir"
	fakechroot fakeroot ./${source} --mode unattended \
	--ooi_password ${ooi_password} \
	--prefix "${srcdir}/${pkgname}" 1>/dev/null || true
}

package() {
	cd "$pkgdir"
	mkdir -p "${pkgdir}/etc/udev/rules.d"
	mkdir -p "${pkgdir}/etc/hotplug/usb"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/licenses"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/opt/OceanOptics/SpectraSuite"

	install -Dm644 \
		${srcdir}/${pkgname}/SystemFiles/oceanoptics \
		${pkgdir}/etc/hotplug/usb/oceanoptics

	install -Dm644 \
		${srcdir}/${pkgname}/SystemFiles/oceanoptics.usermap \
		${pkgdir}/etc/hotplug/usb/oceanoptics.usermap

	install -Dm644 \
		${srcdir}/${pkgname}/SystemFiles/10-oceanoptics.rules \
		${pkgdir}/etc/udev/rules.d/10-oceanoptics.rules

	install -Dm644 \
		${srcdir}/${pkgname}/SystemFiles/SpectraSuiteLinux.png \
		${pkgdir}/usr/share/pixmaps/SpectraSuiteLinux.png

	install -Dm644 \
		${srcdir}/${pkgname}/SystemFiles/spectrasuite.desktop \
		${pkgdir}/usr/share/applications/spectrasuite.desktop

	cp -r ${srcdir}/${pkgname}/{_jvm,platform6,spectrasuite,standards} \
		${pkgdir}/opt/OceanOptics/SpectraSuite

	ln -s \
		/opt/OceanOptics/SpectraSuite/spectrasuite/bin/SpectraSuiteLinux.sh \
		${pkgdir}/usr/bin/spectrasuite

	ln -s /opt/OceanOptics/SpectraSuite/spectrasuite/licenses \
		${pkgdir}/usr/share/licenses/spectrasuite
}
