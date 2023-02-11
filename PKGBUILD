# Maintainer: Sematre <sematre at gmx dot de>
pkgname=pico-sdk
pkgver=1.5.0
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

install=reload-environment-variables.install
source=("git+${url}.git#tag=${pkgver}"
        "setup-environment-variables.sh")
sha256sums=('SKIP'
            '155dbf10a6a9239849a166595bb3287bc410ef54f7d850e8dc9c50fddc1a7a3e')

prepare() {
	cd "${srcdir}/pico-sdk"
	git submodule update --init
}

package() {
	cd "${srcdir}"
	install -Dm644 "setup-environment-variables.sh" "${pkgdir}/etc/profile.d/pico-sdk.sh"

	cd "${srcdir}"
	mkdir -p "${pkgdir}/usr/share"
	cp -r "pico-sdk/" "${pkgdir}/usr/share/${pkgname}"
	cd "${pkgdir}/usr/share/${pkgname}"
	rm -r .git* README.md LICENSE.TXT

	cd "${srcdir}/pico-sdk"
	install -Dm644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
