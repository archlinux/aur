# Maintainer: Patricio A. Rossi (MeduZa) <meduzapat@netscape.net>
# https://github.com/meduzapat/LEDSpicer

pkgbase=ledspicer
pkgname=(
	'libledspicer'
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

pkgver=0.7.3
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
sha256sums=('770f958e3ad3d6805878dddbd3c22478a3489d3847c378e9af62feed4cd6916d')

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

# =============================================================================
# Runtime Library
# =============================================================================

package_libledspicer() {
	pkgdesc="LEDSpicer shared runtime library"
	depends=(
		'tinyxml2>=6.0'
		'libusb>=1.0.22'
		'libpulse>=0.9'
		'alsa-lib>=0.2'
	)

	cd "${srcdir}/LEDSpicer-${pkgver}/build"
	make DESTDIR="${pkgdir}" install

	# Keep only the versioned shared library
	rm -rf "${pkgdir}/usr/bin"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"
	rm -rf "${pkgdir}/usr/lib/ledspicer"
	rm -rf "${pkgdir}/usr/share"
	rm -rf "${pkgdir}/usr/lib/systemd"

	find "${pkgdir}/usr/lib" -maxdepth 1 -type f ! -name "libledspicer.so.*" -delete
}

# =============================================================================
# Main Daemon
# =============================================================================

package_ledspicer() {
	pkgdesc="LED controller daemon for arcade cabinets and RGB lighting"
	depends=(
		'libledspicer'
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

	# Remove library files (handled by libledspicer)
	rm -f "${pkgdir}/usr/lib/libledspicer.so"*
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"

	# Remove device plugins (handled by plugin packages)
	rm -rf "${pkgdir}/usr/lib/ledspicer/devices"
	install -dm755 "${pkgdir}/usr/lib/ledspicer/devices"

	# Install systemd service (not enabled)
	install -Dm644 "${srcdir}/LEDSpicer-${pkgver}/build/ledspicerd.service" \
		"${pkgdir}/usr/lib/systemd/system/ledspicerd.service"
}

# =============================================================================
# Plugins
# =============================================================================

package_ledspicer-nanoled() {
	pkgdesc="LEDSpicer plugin for Ultimarc NanoLed"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/UltimarcNanoLed.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcNanoLed.so"
}

package_ledspicer-pacdrive() {
	pkgdesc="LEDSpicer plugin for Ultimarc PacDrive"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/UltimarcPacDrive.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcPacDrive.so"
}

package_ledspicer-pacled64() {
	pkgdesc="LEDSpicer plugin for Ultimarc PacLed64"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/UltimarcPacLed64.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcPacLed64.so"
}

package_ledspicer-ultimateio() {
	pkgdesc="LEDSpicer plugin for Ultimarc Ultimate I/O"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/UltimarcUltimate.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/UltimarcUltimate.so"
}

package_ledspicer-ledwiz32() {
	pkgdesc="LEDSpicer plugin for Groovy Game Gear LedWiz32"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/LedWiz32.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/LedWiz32.so"
}

package_ledspicer-howler() {
	pkgdesc="LEDSpicer plugin for WolfWareTech Howler"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/Howler.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/Howler.so"
}

package_ledspicer-adalight() {
	pkgdesc="LEDSpicer plugin for Adalight serial LEDs"
	depends=('ledspicer')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/Adalight.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/Adalight.so"
}

package_ledspicer-raspberrypi() {
	pkgdesc="LEDSpicer plugin for Raspberry Pi GPIO"
	depends=('ledspicer' 'pigpio')
	arch=('aarch64' 'armv7h')

	install -Dm755 "${srcdir}/LEDSpicer-${pkgver}/build/RaspberryPi.so" \
		"${pkgdir}/usr/lib/ledspicer/devices/RaspberryPi.so"
}

# =============================================================================
# Development Files
# =============================================================================

package_ledspicer-dev() {
	pkgdesc="LEDSpicer development headers and pkg-config metadata"
	depends=('libledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}"

	# Headers (.hpp only)
	find src -name "*.hpp" | while read -r file; do
		install -Dm644 "$file" "${pkgdir}/usr/include/ledspicer/${file#src/}"
	done

	# Unversioned linker symlink + pkg-config
	install -Dm644 "${srcdir}/LEDSpicer-${pkgver}/build/ledspicer.pc" \
		"${pkgdir}/usr/lib/pkgconfig/ledspicer.pc"

	ln -s libledspicer.so.* "${pkgdir}/usr/lib/libledspicer.so"
}
