# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=findiff
pkgname=python-${_base}
pkgdesc="Python package for finite difference derivatives in any number of dimensions"
pkgver=0.13.1
pkgrel=1
arch=(any)
url="https://github.com/maroba/${_base}"
license=(MIT)
depends=(python-scipy python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('deb951a016850876768a523995264f8ed4d191f6b39057c367eb46f537a78bf969eeb52d045fb23abe4fee7d6787b1360f64a854d5b12aefb6365d64166b27ac')

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
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
