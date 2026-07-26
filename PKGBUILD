# Maintainer: Sematre <sematre at gmx dot de>
pkgname=pico-sdk
pkgver=2.3.0
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
        "git+https://github.com/bluekitchen/btstack.git#commit=075a078"
        "git+https://github.com/georgerobotics/cyw43-driver.git#commit=055d642"
        "git+https://github.com/lwip-tcpip/lwip.git#commit=77dcd25"
        "git+https://github.com/Mbed-TLS/mbedtls.git#commit=0bebf8b"
        "git+https://github.com/hathach/tinyusb.git#commit=86ad6e5"
        "setup-environment-variables.sh")
sha256sums=('31b4489cfb827043bffb05ae5b7bd36c8d3078fac0e6def17aa576df7c5d1b37'
            '16fc13645668c108f41542ccaadc61f829ecbfce37623519c22863c75453ad97'
            'fafd32d84262c4ecbd57d7480fbfea313b63414b0971f2d28b6975d745c51277'
            'cbb5de9cffec63f4be03281eb820c8b6fdda6b0b7a27d0fd4a841296836bf633'
            '985defe6d7a47e7add307a883870904a2cc005a4401fb97b6614dae782e7d402'
            '8bf403d8cbd15e07c88a6214070194b32d6e79ba3a3c30f559480ffdafef2c58'
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
