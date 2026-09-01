# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PyFVTool
pkgname=python-${_base,,}
pkgver=0.6.0
pkgrel=1
pkgdesc="Finite volume toolbox in Python"
arch=(any)
url="https://github.com/FiniteVolumeTransportPhenomena/${_base}"
license=(MIT)
depends=(python-scipy python-matplotlib)
makedepends=(python-build python-installer python-setuptools
  python-sphinx python-myst-parser python-nbsphinx python-sphinx_rtd_theme pandoc-cli)
checkdepends=(python-pytest python-tqdm python-pypardiso)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c0d8217c0e48bf2926e302c391506d59e36ef57c6105e0bf0c4388f60a5f6b60605881b0a5ba4f5fd35f0f3111e561edd40810290602594b57c08980837db30')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  cd docs
  sphinx-apidoc ../src/pyfvtool -o ./source/pyfvtool_api_autodoc
  make html
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -d "${pkgdir}/usr/share/doc/${pkgname}"
  mv docs/build/html "${pkgdir}/usr/share/doc/${pkgname}"
}
