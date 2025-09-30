# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
pkgname=krakenrf-krakensdr-doa-git
_gitname=krakensdr_doa
pkgver=r572.900473c
pkgrel=1
pkgdesc='KrakenSDR DoA DSP'
url='https://github.com/krakenrf/krakensdr_doa'
arch=('x86_64')
license=('GPL-3.0-only')
install=krakensdr_doa.install
makedepends=('git')
depends=('krakenrf-heimdall-daq' 'nodejs' 'php' 'jq' 'miniforge' 'python')
provides=('krakenrf-krakensdr-doa')
conflicts=('krakenrf-heimdall-daq-standalone' 'krakenrf-krakensdr-doa')
source=(
	"git+${url}.git"
	'no-conda.patch'
	'krakensdr_doa.sh'
	'krakensdr_doa.service'
)
sha256sums=(
	'SKIP'
	'6d13285addbd3dec48939bc4132d02b7f7a56f33fb55a2682d177230699fe9ae'
	'8da27160395952838fc1edb92c43d16edc9f7bee71631d744ad99a1a7d916bf7'
	'250a99ee5003f5142b9ddb5ea626f03f1e13bd41304eba567604993ff088251e'
)

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd ${_gitname}
	patch -Np1 -i ../no-conda.patch
}

package() {
	cd "${srcdir}/${_gitname}"

	mkdir -p "${pkgdir}/opt/kraken/krakensdr_doa"
	mkdir -p "${pkgdir}/opt/kraken/krakensdr_doa/util"

	# Install DoA files
	find . -type f -name '*.sh' -exec install -Dm755 {} "${pkgdir}/opt/kraken/krakensdr_doa/{}" \;
	install -Dm755 util/kraken_doa_start.sh util/kraken_doa_stop.sh "${pkgdir}/opt/kraken"
	install -Dm644 __init__.py pyproject.toml "${pkgdir}/opt/kraken/krakensdr_doa"
	cp -R _nodejs "${pkgdir}/opt/kraken/krakensdr_doa"
	cp -R _sdr "${pkgdir}/opt/kraken/krakensdr_doa"
	cp -R _ui "${pkgdir}/opt/kraken/krakensdr_doa"
	cp -R doc "${pkgdir}/opt/kraken/krakensdr_doa"

	# Install custom run script
	install -Dm755 "${srcdir}/krakensdr_doa.sh" "${pkgdir}/usr/bin/krakensdr_doa"

	# Install startup service
	install -Dm644 "${srcdir}/krakensdr_doa.service" "${pkgdir}/usr/lib/systemd/system/krakensdr_doa.service"
}
