# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgbase=edlib
pkgname=(edlib python-edlib)
pkgver=1.2.7
pkgrel=2
pkgdesc='Lightweight, super fast C/C++ (& Python) library for sequence alignment using edit (Levenshtein) distance'
arch=('any')
url=https://github.com/Martinsos/edlib
license=('MIT')
depends=()
makedepends=(
	'cmake'
	'meson'
	'cython'
	'python-setuptools'
	'python-pip'
)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('720c732c76d0d9abe28adce9972b355864571a2e6cbd2c72c3b4a92e045a99e3a688153865586f7e8b6c90433e2eb1bb024ad0a6e9d4eb4b4d401a160d3f13ce')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make configure
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make build
}

check() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make test
}

package_edlib() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgbase}"
	DESTDIR="${pkgdir}" make install
}

package_python-edlib() {
	pkgdesc="Python bindings for edlib"

	cd "${srcdir}/${pkgbase}-${pkgver}/bindings/python"
	export PATH="${PATH}:$(python -m site --user-base)/bin"
	make build
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
