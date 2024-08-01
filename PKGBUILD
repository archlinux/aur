# Mantainer: sgar < swhaat at github >

pkgbase=esphomeyaml
pkgname=esphome
pkgver=2024.7.3
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
sha256sums=('423f261c1f07e8d5f5cfc9bb201653c0ec31e6cae180eba53e0036fba8502fea')

prepare() {
	cd "$srcdir/${pkgname}-${pkgver}"
	## Relax requirements / also optional requiremets
	sed -i 's/==.*//' requirements.txt
	sed -i 's/setuptools==[0-9.]\+/setuptools/' pyproject.toml
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
