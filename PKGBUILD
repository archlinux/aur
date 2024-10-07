# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matspy
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="Sparse matrix spy plot and sparkline renderer that works with Jupyter"
url="https://github.com/alugowski/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy python-html5lib)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1e16d94731cb1cebf321d75c8532c8018be4037bb5ca33a3a78e3784fdc814b8306802145faec6fab9252668e5630f3940f5919aece423116816799d1548f009')

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
