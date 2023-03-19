# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
pkgver=1.1.1
pkgrel=3

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')

depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2d824dbe48969ab9ae4c5311b15bca3449f5758c43602575c2dc3af13fcba195')

build() {
	if [[ -z "${PICO_SDK_PATH}" ]]; then
		error "Couldn't find pico-sdk! Is it set up?"
		exit 1
	fi

	cd "${srcdir}"
	cmake -B build -S "${pkgname}-${pkgver}"
	cmake --build build
}

package() {
	cd "${srcdir}"
	install -Dm755 "build/picotool"         -t "${pkgdir}/usr/bin/"

	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm644 "udev/99-picotool.rules" -t "${pkgdir}/etc/udev/rules.d/"
	install -Dm644 "LICENSE.TXT"               "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
