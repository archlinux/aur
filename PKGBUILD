# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=transip-api
pkgname=python-${_pkgname}-git
pkgver=v2.0.0.r1.g20e58b9
pkgrel=1
pkgdesc="Python implementation of TransIP's API (unofficial)"
arch=('any')
url="https://github.com/benkonrath/transip-api"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python-sphinx')
depends=('python-cryptography' 'python-requests' 'python-suds')
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("git+https://github.com/benkonrath/transip-api.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	python3 setup.py build
	PYTHONPATH="..:${PYTHONPATH}" make -C docs man text
}

check() {
	cd "${_pkgname}"
	python3 setup.py test
}

package() {
	cd "${_pkgname}"
	python3 setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 "docs/_build/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
