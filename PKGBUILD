# Maintainer: Helmut Stult
# Contributor: Simon Keimer <dc0sk at secure dot mailbox dot org>

pkgname=antscope2
pkgver=1.2.6
pkgrel=1
pkgdesc="Visualization tool for RigExpert antenna analyzers"
arch=('x86_64')
url="https://github.com/rigexpert/AntScope2"
license=('MIT')
depends=(qt5-base qt5-serialport libusb glibc gcc-libs)
makedepends=(git)
provide=('antscop2')
conflicts=('antscope2-git')
source=("${pkgname}::git+https://github.com/rigexpert/AntScope2.git#commit=19323af9b8157dff4c260f516d8bda4b05e6a8a9"
		"99-rigexpert.rules"
		"antscope2.desktop")
sha256sums=('62e925e8752670114db77dbf1f599c21736fa8bf7f5fb6fce1c7f62251492d64'
            'dd4395c1241a0e6d967f15bf51c0d0668b5755799877066a227913c071635e94'
            '40138b14572497eaa9c8bc605495295c1ad58de421f0c4a0e1efafd7a4b7800e')


build() {
	cd "${pkgname}"
	qmake-qt5
	make
}

check() {
	cd "${pkgname}"
	make -k check
}

package() {
	cd "${pkgname}/build/release"

	install -Dm755 AntScope2 "${pkgdir}/usr/bin/AntScope2"

	cd "${srcdir}/${pkgname}"
	[ -d "${pkgdir}"/usr/share/antscope2/Resources ] || mkdir -p "${pkgdir}"/usr/share/antscope2/Resources
	install -Dm644 cables.txt "${pkgdir}"/usr/share/antscope2/Resources/cables.txt
	install -Dm644 itu-regions.txt "${pkgdir}"usr/share/antscope2/Resources/itu-regions.txt
	install -Dm644 itu-regions-defaults.txt "${pkgdir}"/usr/share/antscope2/Resources/itu-regions-defaults.txt
	install -Dm644 Calibration/cal_load.s1p "${pkgdir}"/usr/share/antscope2/cal_load.s1p
	install -Dm644 Calibration/cal_open.s1p "${pkgdir}"/usr/share/antscope2/cal_open.s1p
	install -Dm644 Calibration/cal_short.s1p "${pkgdir}"/usr/share/antscope2/cal_short.s1p

	[ -d "${pkgdir}"/usr/share/antscope2/icons ] || mkdir -p "${pkgdir}"/usr/share/antscope2/icons
	install -Dm644 AntScope2.icns "${pkgdir}"/usr/share/antscope2/icons/AntScope2.icns
	install -Dm644 AntScope2.ico "${pkgdir}"/usr/share/antscope2/icons/AntScope2.ico
	install -Dm644 AntScope2.png "${pkgdir}"/usr/share/antscope2/icons/AntScope2.png

	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	cd "${srcdir}"
	install -Dm644 99-rigexpert.rules "${pkgdir}"/etc/udev/rules.d/99-rigexpert.rules
	install -Dm644 antscope2.desktop "${pkgdir}"/usr/share/applications/antscope2.desktop
}
