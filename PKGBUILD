# Maintainer: Omar Pakker <archlinux@opakker.nl>

_pkgname=transip-api
pkgname=python-${_pkgname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Python implementation of TransIP's API (unofficial)"
arch=('any')
url="https://github.com/benkonrath/transip-api"
license=('MIT')
makedepends=('git' 'python-setuptools' 'python-sphinx')
depends=('python-cryptography' 'python-requests' 'python-suds')
source=("https://github.com/benkonrath/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('cc0d7a31f46fc922047928eea518d95e48240a70a034e11094884f40349d09bdce2fc5985ddd56162893baef7031250d8b03795bde6ac75e90a4927b14b121e7')

build() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py build
	PYTHONPATH="..:${PYTHONPATH}" make -C docs man text
}

check() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py test
}

package() {
	cd "${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1

	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 docs/_build/text/*.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 "docs/_build/man/${_pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
