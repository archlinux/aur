#!/usr/bin/env -S sh -c 'nvchecker -c .nvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_pkgname=latexify_py
pkgname=python-${_pkgname//_/-}
pkgdesc="Generates LaTeX math description from Python functions"
_pkgver=0.4.3-post1
pkgver=${_pkgver//-/.}
pkgrel=2
arch=(any)
url=https://github.com/google/${_pkgname}
license=(Apache-2.0)
depends=(python-dill)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(${_pkgname}-${_pkgver}.tar.gz::${url}/archive/v${_pkgver}.tar.gz)
sha512sums=('0c534368827b9776132a6ff7e2bedd6ca70a097ff6abbb22b87399ae17b3b2f04c171e9fae8ecc00103e0f90e367b57c4e832ecbeffad44a9e82a09495ffbaaa')

build() {
	cd ${_pkgname}-${_pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd ${_pkgname}-${_pkgver}
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest src
}

package() {
	cd ${_pkgname}-${_pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
