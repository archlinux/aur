# Maintainer: Sematre <sematre at gmx dot de>
pkgname=pico-sdk
pkgver=2.2.0
pkgrel=2

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
        "git+https://github.com/bluekitchen/btstack.git#commit=501e6d2"
        "git+https://github.com/georgerobotics/cyw43-driver.git#commit=c1075d4"
        "git+https://github.com/lwip-tcpip/lwip.git#commit=0a0452b"
        "git+https://github.com/Mbed-TLS/mbedtls.git#commit=5a764e5"
        "git+https://github.com/hathach/tinyusb.git#commit=86ad6e5"
        "setup-environment-variables.sh")
sha256sums=('3a70d72e41ba8b47ae0f47ebc654d17ba8fa3a42f731f3bccae8b3ff68a5fa4f'
            '3a3a4c5a34bfa2613bc5a774b3cd40651f1215b22f61a2135c0c23fe10f904fa'
            'a50a697c9af5b69f73adcf78663e0591cce83af54e5f9d88a38e7738376813bb'
            '1c62bb98ba930a5e848b6b126fc4272dd36cabdcacec66b1ad12c1aa50c3d2ae'
            '3fdcd908a866e0bb3e3c9e6c995be7ab13fe887c11679193ed769725b2031b35'
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
