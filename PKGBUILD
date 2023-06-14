# Maintainer: Sematre <sematre at gmx dot de>
pkgname=pico-sdk
pkgver=1.5.1
pkgrel=1

pkgdesc="Libraries and tools for C/C++ development on RP2040 microcontrollers."
arch=('any')
url="https://github.com/raspberrypi/pico-sdk"
license=('BSD-3-Clause')

depends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'cmake')
optdepends=('arm-none-eabi-gdb: Debugger')
makedepends=('git')

provides=("raspberry-pico-sdk-git")
conflicts=("raspberry-pico-sdk-git")

options=('!strip')
install=reload-environment-variables.install
source=("git+${url}.git#tag=${pkgver}"
        "git+https://github.com/bluekitchen/btstack.git"
        "git+https://github.com/georgerobotics/cyw43-driver.git"
        "git+https://github.com/lwip-tcpip/lwip.git"
        "git+https://github.com/Mbed-TLS/mbedtls.git"
        "git+https://github.com/hathach/tinyusb.git"
        "setup-environment-variables.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '155dbf10a6a9239849a166595bb3287bc410ef54f7d850e8dc9c50fddc1a7a3e')

prepare() {
	cd "${srcdir}/pico-sdk"
	git submodule init

	git config submodule."lib/btstack".url      "${srcdir}/btstack"
	git config submodule."lib/cyw43-driver".url "${srcdir}/cyw43-driver"
	git config submodule."lib/lwip".url         "${srcdir}/lwip"
	git config submodule."lib/mbedtls".url      "${srcdir}/mbedtls"
	git config submodule."lib/tinyusb".url      "${srcdir}/tinyusb"

	git -c protocol.file.allow=always submodule update
}

package() {
	# Install sdk
	mkdir -p "${pkgdir}/usr/share"
	cp -r "${srcdir}/pico-sdk/" "${pkgdir}/usr/share/${pkgname}"
	rm -r "${pkgdir}/usr/share/${pkgname}"/{.git*,README.md,CONTRIBUTING.md,LICENSE.TXT}

	# Install environment config
	install -Dm644 "${srcdir}/setup-environment-variables.sh" "${pkgdir}/etc/profile.d/pico-sdk.sh"

	# Install docs
	install -Dm644 "${srcdir}/pico-sdk/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"

	# Install license
	install -Dm644 "${srcdir}/pico-sdk/LICENSE.TXT" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
