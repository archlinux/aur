# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fiat
pkgname=python-firedrake-${_base}
pkgdesc="FInite element Automatic Tabulator"
pkgver=2026.4.0
pkgrel=1
arch=(any)
url="https://github.com/firedrakeproject/${_base}"
license=(LGPL-3.0-only GPL-3.0-only)
depends=(python-fenics-ufl python-recursivenodes python-scipy python-symengine python-sympy)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest git)
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('0a07ac2e20b971254244fa1a3b0d710e2b79d17b920d4753b30f4c624f758ba60d383b52d402eab3eb9e6adde2296310c6412c6043b39652bd478b3e8a85ae6f')

build() {
	cd ${_base}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd ${_base}-${pkgver}
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest
}

package() {
	cd ${srcdir}/${_base}-${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 COPYING* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
