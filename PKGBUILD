# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=dell-g5se-fanctl
pkgver=3.3.2
pkgrel=2
_srcpkgver=3.3-2
pkgdesc='Script to automatically set fan speed according to cpu and gpu thermals on Dell G5SE laptops.'
url='https://github.com/DavidLapous/DellG5SE-Fan-Linux'
arch=('x86_64')
license=('MIT')
depends=()
makedepends=()
install='install.install'
_srcdir="DellG5SE-Fan-Linux-${_srcpkgver}"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/DavidLapous/DellG5SE-Fan-Linux/archive/refs/tags/v${_srcpkgver}.tar.gz"
	'dell-smm-hwmon-module.conf'
	'dell-smm-hwmon-modprobe.conf'
	'dell-g5se-fanctl.conf'
	'dell-g5se-fanctl.service'
	'dell-g5se-fanctl-sleep.service'
)
sha256sums=(
	'69af44777486d9741ea3a840a499ffb0af8686bc9b895967b45b396a97b30d3b'
	'a068a92ff638389f04c90f34cfdbb9941a69617950ddb93da2dd65504b855f82'
	'fd87577fda66330c86073bf8841dae915f2f2054a42f5e9a66ff6fad06dd9416'
	'173110bac7b9c571fba6dd0dc446fbe79978663e49348cb729e87bbe9d982997'
	'966e2fbc26a5d9639cbb48b93a0bca18f224992763b067d702b27233438d8f15'
	'5b96ebc051d27f23aa4c2b835d5d5c455fcb51517df9f0656cf5e00ade9c0b3d'
)
backup=('etc/dell-g5se-fanctl.conf')

build() {
	mkdir -p "build"
	g++ -std=c++20 -lstdc++fs ${CXXFLAGS} "${_srcdir}/DellFan.cpp" -o 'build/dell-g5se-fanctl'
}

package() {
	install -Dm755 'build/dell-g5se-fanctl' -t "${pkgdir}/usr/bin/"
	install -Dm755 "${_srcdir}/DellG5SEFan.py" "${pkgdir}/usr/bin/dell-g5se-fanctl.py"
	install -Dm644 'dell-smm-hwmon-module.conf' -t "${pkgdir}/etc/modules-load.d/"
	install -Dm644 'dell-smm-hwmon-modprobe.conf' -t "${pkgdir}/etc/modprobe.d/"
	install -Dm644 'dell-g5se-fanctl.conf' -t "${pkgdir}/etc/"
	install -Dm644 'dell-g5se-fanctl.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 'dell-g5se-fanctl-sleep.service' -t "${pkgdir}/usr/lib/systemd/system/"
  install -Dpm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
