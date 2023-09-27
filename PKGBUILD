# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
pkgver=1.1.2
pkgrel=2

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')

depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        "70-picotool.rules")
sha256sums=('f1746ead7815c13be1152f0645db8ea3b277628eb0110d42a0a186db37d40a91'
            'de1a6ed1862e0fe31c4ebcaf322654203dfc07fd59c38e721f9bec48be1872a8')

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
	cmake -B build -S "${pkgname}-${pkgver}"
	cmake --build build
}

package() {
	# Install application
	install -Dm755 "${srcdir}/build/picotool" -t "${pkgdir}/usr/bin/"

	# Install udev rules
	install -Dm644 "${srcdir}/70-picotool.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"

	# Install docs
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

	# Install license
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.TXT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
