# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=MPSPlots
pkgname=python-${_base,,}
pkgdesc="A matplotlib wrapper for defered plots and plotting styles"
pkgver=1.8.5
pkgrel=1
arch=(any)
url="https://github.com/MartinPdeS/${_base}"
license=(MIT)
depends=(python-pyvista)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e6440f3cf105d412b847763a6a99167988f1ceeb8199c1c76e969a71bcf48d1f1e4108bfcf063d5435a5564188468d5b1f06165e8259849d5fb23fed1546e192')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
