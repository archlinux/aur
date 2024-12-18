# Maintainer: Sematre <sematre at gmx dot de>
pkgname=pico-sdk
pkgver=2.1.0
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
        "git+https://github.com/bluekitchen/btstack.git#commit=2b49e57"
        "git+https://github.com/georgerobotics/cyw43-driver.git#commit=cf924bb"
        "git+https://github.com/lwip-tcpip/lwip.git#commit=0a0452b"
        "git+https://github.com/Mbed-TLS/mbedtls.git#commit=5a764e5"
        "git+https://github.com/hathach/tinyusb.git#commit=5217cee"
        "setup-environment-variables.sh")
sha256sums=('23acedc0e067cca748aab1041e02d74c8ea29b8ab8689d1ae3a20384e82f105d'
            '3e869dafec34543abede6be4dafd1948278deb63875dbb21f4ecb278e2a40995'
            '4310d116bb0791fb3d60379b15140bced784921727b325c391a50f22dbf50a3a'
            '1c62bb98ba930a5e848b6b126fc4272dd36cabdcacec66b1ad12c1aa50c3d2ae'
            '3fdcd908a866e0bb3e3c9e6c995be7ab13fe887c11679193ed769725b2031b35'
            '32559c162d8bb984220570edec989223731542ccc41f65f419344c74330a3937'
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
