# Maintainer: Helmut Stult
# Contributor: Simon Keimer <dc0sk at secure dot mailbox dot org>

pkgname=antscope2
pkgver=1.2.6
pkgrel=3
pkgdesc="Visualization tool for RigExpert antenna analyzers"
arch=('x86_64')
url="https://github.com/rigexpert/AntScope2"
license=('MIT')
depends=(qt5-base qt5-serialport libusb glibc gcc-libs)
makedepends=(git)
provide=('antscope2')
conflicts=('antscope2' 'antscope2-git')
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

package() {
	cd "${srcdir}/${pkgname}"
	[ -d "${pkgdir}"/usr/share/antscope2/Resources ] || mkdir -p "${pkgdir}"/usr/share/antscope2/Resources
	[ -d "${pkgdir}"/usr/share/antscope2/icons ] || mkdir -p "${pkgdir}"/usr/share/antscope2/icons
	[ -d "${pkgdir}"/usr/bin ] || mkdir -p "${pkgdir}"/usr/bin

	cd "${srcdir}/${pkgname}/build/release"
	install -Dm755 AntScope2 -t "${pkgdir}/usr/share/antscope2"

	cd "${pkgdir}/usr/share/antscope2/"
	ln -sf "/usr/share/antscope2/AntScope2" "${pkgdir}/usr/bin"

	cd "${srcdir}/${pkgname}"
	install -Dm644 cables.txt -t "${pkgdir}"/usr/share/antscope2/Resources
	install -Dm644 itu-regions.txt -t "${pkgdir}"/usr/share/antscope2/Resources
	install -Dm644 itu-regions-defaults.txt -t "${pkgdir}"/usr/share/antscope2/Resources
	install -Dm644 Calibration/cal_load.s1p -t "${pkgdir}"/usr/share/antscope2
	install -Dm644 Calibration/cal_open.s1p -t "${pkgdir}"/usr/share/antscope2
	install -Dm644 Calibration/cal_short.s1p -t "${pkgdir}"/usr/share/antscope2

	install -Dm644 AntScope2.icns -t "${pkgdir}"/usr/share/antscope2/icons
	install -Dm644 AntScope2.ico -t "${pkgdir}"/usr/share/antscope2/icons
	install -Dm644 AntScope2.png -t "${pkgdir}"/usr/share/antscope2/icons

	install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"

	cd "${srcdir}"
	install -Dm644 99-rigexpert.rules -t "${pkgdir}"/etc/udev/rules.d
	install -Dm644 antscope2.desktop -t "${pkgdir}"/usr/share/applications
}
