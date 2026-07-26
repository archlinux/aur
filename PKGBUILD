# Maintainer: Sematre <sematre at gmx dot de>
pkgname=picotool
_pkgver=2.3.0
pkgver=${_pkgver//-/.}
pkgrel=1

pkgdesc="Tool for inspecting RP2040 binaries and interacting with RP2040 devices."
arch=('any')
url="https://github.com/raspberrypi/picotool"
license=('BSD-3-Clause')

depends=('gcc-libs' 'libusb')
makedepends=('pico-sdk' 'cmake')

source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('ee60c3fcdc2ccc8da0ec1b58b7a86132b808ca3424c76b6bdd978deadad4844b')

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
	cmake -B build -S "${pkgname}-${_pkgver}" -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cmake --build build
}

package() {
	# Install application etc
	DESTDIR="$pkgdir" cmake --install build

	# Install udev rules
	install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/udev/60-picotool.rules" -t "${pkgdir}/usr/lib/udev/rules.d/"

	# Install docs
	install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

	# Install license
	install -Dm644 "${srcdir}/${pkgname}-${_pkgver}/LICENSE.TXT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
