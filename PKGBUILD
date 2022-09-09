# Maintainer: Oskar Roesler <oskar@oskar-roesler.de>
pkgname=esp8266-rtos-sdk
pkgver=3.4
pkgrel=3
pkgdesc="ESP8266 RTOS SDK"
arch=('x86_64')
url="https://github.com/espressif/ESP8266_RTOS_SDK"
license=('Espressif MIT')
depends=(python python-click python-pyserial python-cryptography python-pyparsing python-future python-pyelftools ncurses)
optdepends=('xtensa-lx106-elf-gcc-bin: Toolchain for the ESP8266')
makedepends=(gcc gperf)
options=(!strip)
source=("https://github.com/espressif/ESP8266_RTOS_SDK/releases/download/v${pkgver}/ESP8266_RTOS_SDK-v${pkgver}.zip"
	"esp8266-rtos-sdk.sh")
sha256sums=('1e6c0da481f844de8eeb85dfb2db9d7c130cffc2047549eb34b3deaf9bd515c1'
            '8fd9449b64edd705c635e4a9f482c2a38b877a939ebadaba375f1a3ef06648f3')

build() {
	# enable 'make menuconfig'
	make -C ESP8266_RTOS_SDK/tools/kconfig
	strip -s ESP8266_RTOS_SDK/tools/kconfig/*conf-idf
	rm -rf ESP8266_RTOS_SDK/tools/kconfig/*.[od]
	rm -rf ESP8266_RTOS_SDK/tools/kconfig/lxdialog/*.[od]
	# tools/ldgen/test has lots of failures
	sed -i -e 's/pyparsing.*/pyparsing/' ESP8266_RTOS_SDK/requirements.txt
}

package() {
	install -d "$pkgdir"/opt/$pkgname
	cp -af ESP8266_RTOS_SDK/* "$pkgdir"/opt/$pkgname
	install -Dm755 "$srcdir"/esp8266-rtos-sdk.sh "$pkgdir"/etc/profile.d/esp8266-rtos-sdk.sh
}
