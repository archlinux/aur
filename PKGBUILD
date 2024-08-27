# Mantainer: sgar < swhaat at github >

pkgbase=esphomeyaml
pkgname=esphome
pkgver=2024.8.0
pkgrel=1
pkgdesc="Solution for your ESP8266/ESP32 projects with Home Assistant"
url="https://github.com/esphome/ESPHome"
depends=(
	'python-voluptuous'
	'python-yaml'
	'python-paho-mqtt'
	'python-colorlog'
	'python-icmplib'
	'python-tornado'
	'python-tzlocal'
	'python-tzdata'
	'python-pyserial'
	'platformio-core'
	'esptool'
	'python-click'
	'python-aioesphomeapi'
	'python-zeroconf'
	'python-magic'
	'python-ruamel-yaml'
	'python-kconfiglib'
	'python-pyparsing'
	'python-argcomplete'
	'python-pillow'
	'python-cairosvg'
)
optdepends=('python-esphome-dashboard: esphome dashboard addition')
makedepends=('python-build' 'python-installer' 'python-wheel')
license=('MIT')
arch=('any')
replaces=('esphomeyaml')
source=("https://github.com/esphome/ESPHome/archive/${pkgver}.tar.gz")
sha256sums=('b7509d8ffee33d121acdc7618b318d0556e768b0481965ae8a3125790c73d366')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	## Relax requirements / also optional requiremets
	sed -i 's/==.*//' requirements.txt
	sed -i 's/setuptools==[0-9.]\+/setuptools/' pyproject.toml
	sed -i 's/wheel~=[0-9.]\+/wheel/' pyproject.toml
	pillowVersion=$(pacman -Qi python-pillow | grep Version | awk '{print $3}' | awk -F- '{print $1}')
	sed -i "s/10.2.0/$pillowVersion/" esphome/components/font/__init__.py
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
	cd "$srcdir/${pkgname}-${pkgver}"

	##	 Run tests, takes a while
	cp ${pkgname}/__main__.py ${pkgname}.py
	#    python esphome.py tests/test1.yaml compile
	#    python esphome.py tests/test2.yaml compile
}
