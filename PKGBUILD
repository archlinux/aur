# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=dell-g5se-fanctl
pkgver=3.4
pkgrel=2
pkgdesc='Script to automatically set fan speed according to cpu and gpu thermals on Dell G5SE laptops.'
url='https://github.com/DavidLapous/DellG5SE-Fan-Linux'
arch=('x86_64')
license=('MIT')
depends=()
makedepends=()
install='install.install'
_srcdir="DellG5SE-Fan-Linux-${pkgver}"
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/DavidLapous/DellG5SE-Fan-Linux/archive/refs/tags/v${pkgver}.tar.gz"
	'dell-smm-hwmon-module.conf'
	'dell-smm-hwmon-modprobe.conf'
	'dell-g5se-fanctl.conf'
	'dell-g5se-fanctl.service'
	'dell-g5se-fanctl-sleep.service'
)
sha256sums=('05e25ac15463f70333da35d70f659479d4db64bedfb824110a084de4ab996bc2'
            'a068a92ff638389f04c90f34cfdbb9941a69617950ddb93da2dd65504b855f82'
            'fd87577fda66330c86073bf8841dae915f2f2054a42f5e9a66ff6fad06dd9416'
            '1738638b639303f19d312f38ae2635db47aa7952487fb9e621abca3e327c5e0b'
            'a4192f981315ea0639ed8178c9f3dce5e15c126ad84c1982fb863dadeb9d115a'
            '5b96ebc051d27f23aa4c2b835d5d5c455fcb51517df9f0656cf5e00ade9c0b3d')
backup=('etc/dell-g5se-fanctl.conf')

build() {
	mkdir -p 'build'
	g++ -std=c++20 -lstdc++fs ${CPPFLAGS} ${CXXFLAGS} "${_srcdir}/DellFan.cpp" -o 'build/dell-g5se-fanctl'
}

package() {
	install -Dm755 'build/dell-g5se-fanctl' -t "${pkgdir}/usr/bin/"
	install -Dm755 "${_srcdir}/DellG5SEFan.py" "${pkgdir}/usr/bin/dell-g5se-fanctl.py"
	install -Dm644 'dell-smm-hwmon-module.conf' -t "${pkgdir}/usr/lib/modules-load.d/"
	install -Dm644 'dell-smm-hwmon-modprobe.conf' -t "${pkgdir}/usr/lib/modprobe.d/"
	install -Dm644 'dell-g5se-fanctl.conf' -t "${pkgdir}/etc/"
	install -Dm644 'dell-g5se-fanctl.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 'dell-g5se-fanctl-sleep.service' -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dpm644 "${_srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
