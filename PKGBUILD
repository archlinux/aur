# Maintainer: Marcel Unbehaun <f.rostze.ux at gmail dot com>
_pkgname="streamdeckapi"
pkgname=("python-streamdeckapi")

pkgver=0.0.11
pkgrel=2
pkgdesc="Stream Deck API Library for Home Assistant"
arch=('x86_64')
url="https://github.com/Patrick762/${_pkgname}"
license=('MIT')
depends=('python-requests' 'python-websockets' 'python-aiohttp' 'python-jsonpickle' 'python-elgato-streamdeck' 'python-pillow' 'python-cairosvg' 'python-zeroconf')
makedepends=()

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Patrick762/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
				"${_pkgname}.service"
				"${_pkgname}-xdg_home_uuid.patch"
				"10-streamdeck.rules")

prepare() {
  patch -d "${_pkgname}-${pkgver}" -p0 < "${_pkgname}-xdg_home_uuid.patch"
}

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build 
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  cd - 
  install -Dm 644 "${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm 644 -t "${pkgdir}/etc/udev/rules.d" 10-streamdeck.rules
}

sha256sums=('5cfe6b3363adf3115d2adcc347887023f149bb802285b9c2b273ca4617a31d62'
            'd651acb5b9530a24742478deab346bb31d5c8359257e7cabb75e37bb5f1e6b17'
            '45d5a05bacc0942edaf370cac20e3bac8ab5776b7c27056c563df86475e93113'
            '21bbef2de9197b14a6eae4ecfd8a5089829a2f31697290d3ae28218936bdccf9')
