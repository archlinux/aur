# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fiat
pkgname=python-firedrake-${_base}
pkgdesc="FInite element Automatic Tabulator"
pkgver=2025.10.1
pkgrel=1
arch=(any)
url="https://github.com/firedrakeproject/${_base}"
license=(LGPL-3.0-only GPL-3.0-only)
depends=(python-fenics-ufl python-recursivenodes python-scipy python-symengine python-sympy)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest git)
options=(!emptydirs)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('293af7fd7b95233177f467f89de93f0240279f9802147b06d7cf6ef5f810aeb608e6f0f21e10385a688dd72c3d5670c609f4fba35e2e0e015ae73daf49dc8357')

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
