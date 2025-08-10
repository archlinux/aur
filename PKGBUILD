# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
pkgver=2.2.0
pkgrel=1

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')

depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "70-picotool.rules")
sha256sums=('aab3d82fb1e576d97156ddcb962ae7cf290518a5f20d9002ac27e628dc657620'
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
