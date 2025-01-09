#!/usr/bin/env -S sh -c 'nvchecker -c .nvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_pkgname=latexify_py
pkgname=python-${_pkgname//_/-}
pkgdesc="Generates LaTeX math description from Python functions"
pkgver=0.4.4
pkgrel=1
arch=(any)
url=https://github.com/google/${_pkgname}
license=(Apache-2.0)
depends=(python-dill)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(${_pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b46bbd8a3e3a5b85246b3500430ee5ba119ed8e7ffa7577b9dc2a55f8c205b003505a564b7e88c08cb301838af8e25cf6fc861b1df09ca4ae9b1191bf897ed9f')

build() {
	cd ${_pkgname}-${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd ${_pkgname}-${pkgver}
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest src
}

package() {
	cd ${_pkgname}-${pkgver}
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
