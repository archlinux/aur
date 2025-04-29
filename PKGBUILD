# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
pkgver=2.1.1
pkgrel=2

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')

depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "70-picotool.rules")
sha256sums=('19200c6dc4be5acd6fb53de3d7f35c826af596c18879d56f214b795300100260'
            'e7abda1f88afddc2f49b27d0edce0f2a1daba7c7b90260a5e6fccc456da24b18')

build() {
	if [ -z "${PICO_SDK_PATH}" ]; then
		if [ -d "/usr/share/pico-sdk" ]; then
			warning "PICO_SDK_PATH is not set! Using default path: /usr/share/pico-sdk"
			export PICO_SDK_PATH=/usr/share/pico-sdk
		else
			error "Couldn't find pico-sdk! Is it set up?"
			exit 1
		fi
	fi

	cd "${srcdir}"
	cmake -B build -S "${pkgname}-${pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build build
}

package() {
	# Install application etc
	DESTDIR="$pkgdir" cmake --install build

	# Install udev rules
	install -Dm644 "${srcdir}/70-picotool.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"

	# Install docs
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

	# Install license
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.TXT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
