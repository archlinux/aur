# Maintainer: Patricio A. Rossi (MeduZa) <meduzapat@netscape.net>
# https://github.com/meduzapat/LEDSpicer

pkgbase=ledspicer
pkgname=(
	'ledspicer'
	'ledspicer-nanoled'
	'ledspicer-pacdrive'
	'ledspicer-pacled64'
	'ledspicer-ultimateio'
	'ledspicer-ledwiz32'
	'ledspicer-howler'
	'ledspicer-adalight'
	'ledspicer-dev'
)
# Add RaspberryPi only on ARM
if [[ "$CARCH" == "aarch64" || "$CARCH" == "armv7h" ]]; then
	pkgname+=('ledspicer-raspberrypi')
fi

pkgver=0.7.2
pkgrel=1
pkgdesc="LED controller daemon for arcade cabinets and RGB lighting"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/meduzapat/LEDSpicer"
license=('GPL3')
makedepends=(
	'cmake>=3.10'
	'gcc'
	'pkg-config'
	'tinyxml2>=6.0'
	'libusb>=1.0.22'
	'libpulse>=0.9'
	'alsa-lib>=0.2'
)
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/meduzapat/LEDSpicer/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

# Add pigpio for ARM builds
if [[ "$CARCH" == "aarch64" || "$CARCH" == "armv7h" ]]; then
	makedepends+=('pigpio')
fi

build() {
	cd "${srcdir}/LEDSpicer-${pkgver}"

	local _cmake_opts=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_SYSCONFDIR=/etc
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_CXX_FLAGS='-g0 -O3'
		-DENABLE_PULSEAUDIO=ON
		-DENABLE_ALSAAUDIO=ON
		-DENABLE_NANOLED=ON
		-DENABLE_PACDRIVE=ON
		-DENABLE_PACLED64=ON
		-DENABLE_ULTIMATEIO=ON
		-DENABLE_LEDWIZ32=ON
		-DENABLE_HOWLER=ON
		-DENABLE_ADALIGHT=ON
	)

	# Enable RaspberryPi only on ARM
	if [[ "$CARCH" == "aarch64" || "$CARCH" == "armv7h" ]]; then
		_cmake_opts+=("-DENABLE_RASPBERRYPI=ON")
	fi

	mkdir -p build
	cd build
	cmake "${_cmake_opts[@]}" ..
	make -j$(nproc)
}

package_ledspicer() {
	pkgdesc="LED controller daemon for arcade cabinets and RGB lighting"
	depends=(
		'tinyxml2>=6.0'
		'libusb>=1.0.22'
		'libpulse>=0.9'
		'alsa-lib>=0.2'
	)
	optdepends=(
		'ledspicer-nanoled: Ultimarc NanoLed support'
		'ledspicer-pacdrive: Ultimarc PacDrive support'
		'ledspicer-pacled64: Ultimarc PacLed64 support'
		'ledspicer-ultimateio: Ultimarc Ultimate I/O support'
		'ledspicer-ledwiz32: Groovy Game Gear LedWiz32 support'
		'ledspicer-howler: WolfWareTech Howler support'
		'ledspicer-adalight: Adalight serial LED support'
		'ledspicer-raspberrypi: Raspberry Pi GPIO support (ARM only)'
		'ledspicer-dev: Development headers'
	)
	backup=('etc/ledspicer.conf')
	install=ledspicer.install

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	make DESTDIR="${pkgdir}" install

	# Remove dev files (will be in ledspicer-dev)
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"

	# Remove device plugins (will be in separate packages)
	rm -rf "${pkgdir}/usr/lib/ledspicer/devices"

	# Create empty devices directory
	install -dm755 "${pkgdir}/usr/lib/ledspicer/devices"

	# Install udev rules
	install -Dm644 "${srcdir}/LEDSpicer-${pkgver}/data/21-ledspicer.rules" \
		"${pkgdir}/usr/lib/udev/rules.d/21-ledspicer.rules"

	# Install systemd service
	install -Dm644 "${srcdir}/LEDSpicer-${pkgver}/build/ledspicerd.service" \
		"${pkgdir}/usr/lib/systemd/system/ledspicerd.service"
}

package_ledspicer-nanoled() {
	pkgdesc="LEDSpicer plugin for Ultimarc NanoLed"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "UltimarcNanoLed.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcNanoLed.so"
}

package_ledspicer-pacdrive() {
	pkgdesc="LEDSpicer plugin for Ultimarc PacDrive"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "UltimarcPacDrive.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcPacDrive.so"
}

package_ledspicer-pacled64() {
	pkgdesc="LEDSpicer plugin for Ultimarc PacLed64"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "UltimarcPacLed64.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcPacLed64.so"
}

package_ledspicer-ultimateio() {
	pkgdesc="LEDSpicer plugin for Ultimarc Ultimate I/O"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "UltimarcUltimate.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcUltimate.so"
}

package_ledspicer-ledwiz32() {
	pkgdesc="LEDSpicer plugin for Groovy Game Gear LedWiz32"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "LedWiz32.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/LedWiz32.so"
}

package_ledspicer-howler() {
	pkgdesc="LEDSpicer plugin for WolfWareTech Howler"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "Howler.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/Howler.so"
}

package_ledspicer-adalight() {
	pkgdesc="LEDSpicer plugin for Adalight serial LEDs"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "Adalight.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/Adalight.so"
}

package_ledspicer-raspberrypi() {
	pkgdesc="LEDSpicer plugin for Raspberry Pi GPIO"
	depends=('ledspicer' 'pigpio')
	arch=('aarch64' 'armv7h')

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	install -Dm755 "RaspberryPi.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/RaspberryPi.so"
}

package_ledspicer-dev() {
	pkgdesc="LEDSpicer development headers"
	depends=('ledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}"

	# Install headers preserving directory structure
	find src -name "*.hpp" | while read -r file; do
		install -Dm644 "$file" "${pkgdir}/usr/include/ledspicer/${file#src/}"
	done

	# Install pkgconfig
	install -Dm644 "${srcdir}/LEDSpicer-${pkgver}/build/ledspicer.pc" \
		"${pkgdir}/usr/lib/pkgconfig/ledspicer.pc"
}
