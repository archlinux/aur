# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
# It's a mess but the entire KrakenRF stack is a mess
pkgname=krakenrf-heimdall-daq-standalone-git
_gitname=heimdall_daq_fw
pkgver=r249.1efc252
pkgrel=1
pkgdesc='Coherent data acquisition signal processing chain for multichannel SDRs (for KrakenSDR, without KrakenSDR DoA dependencies)'
url='https://github.com/krakenrf/heimdall_daq_fw'
arch=('x86_64')
license=('GPL-3.0-only')
install=heimdall.install
provides=('krakenrf-heimdall-daq')
conflicts=('krakenrf-heimdall-daq')
makedepends=('git')
depends=(
	'gcc-libs'
	'glibc'
	'krakenrf-kfr'
	'krakenrf-librtlsdr'
	'libusb'
	'miniforge'
	'perl'
	'python'
	'zeromq'
	'zlib'
)
source=(
	"git+${url}.git"
	'environment.yml'
	'heimdall.sh'
	'heimdall.service'
)
sha256sums=(
	'SKIP'
	'82b258480fbd05b990f44bda89c2ee84454eb7ea988c9e8e0095368bbaca51dc'
	'53435feffea9991ea3328ffe063cf2ad411c464916d86fa1d7d0e4d34896491d'
	'8629969dd00f613a42e6c9127bd68a13c3839d6611b6c106cca4a5c238f99ac8'
)

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/Firmware/_daq_core"
	make
}

package() {
	cd "${srcdir}/${_gitname}/Firmware"

	mkdir -p "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware"
	mkdir -p "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/_calibration"
	mkdir -p "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/_daq_core"
	mkdir -p "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/_data_control"
	mkdir -p "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/_logs"
	mkdir -p "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/_testing"

	# Install heimdall_daq_fw/Firmware files
	find . -type f -name '*.out' -exec install -Dm755 {} "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/{}" \;
	find . -type f -name '*.py' -exec install -Dm644 {} "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/{}" \;
	find . -type f -name '*.ini' -exec install -Dm644 {} "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/{}" \;
	install -Dm755 daq_start_sm.sh "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware"
	install -Dm755 daq_stop.sh "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware"
	install -Dm644 _data_control/iq_track_lock "${pkgdir}/opt/kraken/heimdall_daq_fw/Firmware/_data_control"

	# Install custom run script
	install -Dm755 "${srcdir}/heimdall.sh" "${pkgdir}/usr/bin/heimdall"

	# Install startup service
	install -Dm644 "${srcdir}/heimdall.service" "${pkgdir}/usr/lib/systemd/system/heimdall.service"

	# Conda setup
	[ -f /opt/miniforge/etc/profile.d/conda.sh ] && source /opt/miniforge/etc/profile.d/conda.sh
	conda env create --prefix "${pkgdir}/opt/kraken/conda" --file "${srcdir}/environment.yml"
}
