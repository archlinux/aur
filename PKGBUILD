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

pkgver=0.7.3
pkgrel=3
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

build() {
	cd "${srcdir}/LEDSpicer-${pkgver}"

	local cmake_opts=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DCMAKE_INSTALL_SYSCONFDIR=/etc
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_CXX_FLAGS='-O3 -g0'
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

	cmake -S . -B build "${cmake_opts[@]}"
	cmake --build build
}

package_libledspicer() {
	pkgdesc="LEDSpicer shared runtime library"
	depends=(
		'tinyxml2>=6.0'
		'libusb>=1.0.22'
	)

	DESTDIR="${pkgdir}" cmake --install "${srcdir}/LEDSpicer-${pkgver}/build"

	# Keep only versioned shared library
	rm -rf "${pkgdir}/usr/bin"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"
	rm -rf "${pkgdir}/usr/lib/ledspicer"
	rm -rf "${pkgdir}/usr/share"
	rm -rf "${pkgdir}/usr/lib/systemd"

	find "${pkgdir}/usr/lib" -type f ! -name 'libledspicer.so.*' -delete
}

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
		'ledspicer-dev: Development headers'
	)

	install=ledspicer.install

	DESTDIR="${pkgdir}" cmake --install "${srcdir}/LEDSpicer-${pkgver}/build"

	# Remove library artifacts (handled by libledspicer)
	rm -f "${pkgdir}/usr/lib/libledspicer.so"*
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"

	# Remove plugins (handled by subpackages)
	rm -rf "${pkgdir}/usr/lib/ledspicer/devices"
	install -dm755 "${pkgdir}/usr/lib/ledspicer/devices"
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

package_ledspicer-dev() {
	pkgdesc="LEDSpicer development headers and pkg-config metadata"
	depends=('libledspicer')

	cd "${srcdir}/LEDSpicer-${pkgver}"

	find src -name '*.hpp' | while read -r file; do
		install -Dm644 "$file" "${pkgdir}/usr/include/ledspicer/${file#src/}"
	done

	install -Dm644 build/ledspicer.pc \
		"${pkgdir}/usr/lib/pkgconfig/ledspicer.pc"

	ln -s libledspicer.so.1 "${pkgdir}/usr/lib/libledspicer.so"
}
