# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=recursivenodes
pkgname=python-${_base}
pkgdesc="Recursively defined interpolation nodes for the simplex"
pkgver=0.3.0
pkgrel=1
arch=(any)
url="https://gitlab.com/tisaac/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-pytest)
source=(${url}/-/archive/v${pkgver}/${_base}-v${pkgver}.tar.gz)
sha512sums=('589d1feff957b44990563fef877e346d55b8fffef7433cddbeead4159f54d50a414324db7f60f6e6ef9a5cafcb17175e603500503c605257ec70c42a9111eeec')

build() {
	cd ${_base}-v${pkgver}
	python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
	cd ${_base}-v${pkgver}
	python -m venv --system-site-packages test-env
	test-env/bin/python -m installer dist/*.whl
	test-env/bin/python -m pytest
}

package() {
	cd ${_base}-v${pkgver}
	PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
