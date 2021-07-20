# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
pkgver=1.0.1
pkgrel=1

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')
depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "gcc-11-compatibility.patch")
sha256sums=('622d4804d23dcb3cbac2861a932e4545a7190a14bb6707e042987c07cf16e4ff'
            '93fe74d04325236a7d99dd615cb663705225ecb2913ce10c16d36077956b71dd')

prepare() {
	patch --forward --strip=1 --input="gcc-11-compatibility.patch"
}

build() {
	if [[ -z "${PICO_SDK_PATH}" ]]; then
		error "Couldn't find pico-sdk! Is it set up?"
		exit 1
	fi

	cd "${srcdir}/${pkgname}-${pkgver}"
	cmake -B build
	make -C build
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 "build/picotool" -t "${pkgdir}/usr/bin/"
	install -Dm644 "LICENSE.TXT"       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
