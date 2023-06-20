# Maintainer: Bao Trinh <qubidt at gmail dot com>

pkgbase=edlib
pkgname=(edlib python-edlib)
pkgver=1.2.7
_commit=ce008ea6c2c3d8c40a7a85e668f8fb75127d454a  # tag: python-1.3.9
pkgrel=4
pkgdesc='Lightweight, super fast C/C++ (& Python) library for sequence alignment using edit (Levenshtein) distance'
arch=('any')
url=https://github.com/Martinsos/edlib
license=('MIT')
depends=()
makedepends=(
	'git'
	'cmake'
	'meson'
	'cython'
	'python-setuptools'
	'python-build'
	'python-installer'
	'python-wheel'
	'python-cogapp'
)
source=("${pkgbase}-${pkgver}::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make configure
	sed -Ei '/pip install (cython|cogapp)/d' "${srcdir}/${pkgbase}-${pkgver}/bindings/python/Makefile"
}

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"
	make build
	cd "${srcdir}/${pkgbase}-${pkgver}/bindings/python"
	cp -rf ../../edlib .
	make pyedlib.bycython.cpp README.rst
	python -m build --wheel --no-isolation
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
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
