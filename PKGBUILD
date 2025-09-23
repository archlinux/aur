# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=ble2mqtt-git
_gitname=ble2mqtt
pkgver=0.2.5.r1.g9ec2940
pkgrel=1
pkgdesc='Bluetooth to MQTT bridge, add your bluetooth-capable devices to your smart home'
url='https://github.com/devbis/ble2mqtt'
arch=('any')
license=('MIT')
depends=('python-pycryptodome' 'python-aio-mqtt-mod' 'python-bleak')
makedepends=('git' 'python-build' 'python-setuptools' 'python-installer' 'python-wheel')
conflicts=('ble2mqtt' 'ble2mqtt-git')
provides=('ble2mqtt')
source=(
	'git+https://github.com/devbis/ble2mqtt.git'
	ble2mqtt.service
)
sha256sums=('SKIP'
            'dbee267198251eabb3a9450bc0275d74ba8b3b7b9b49f6f03df3f3f2bd27dfd5')

pkgver() {
	cd "$srcdir/$_gitname"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$_gitname"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/$_gitname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 ../ble2mqtt.service "$pkgdir"/usr/lib/systemd/system/ble2mqtt.service

}
