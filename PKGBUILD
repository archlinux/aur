# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=trame-plotly
pkgname=python-${_base}
pkgdesc="Plotly figure widget for trame"
pkgver=3.1.2
pkgrel=2
arch=(any)
url="https://github.com/Kitware/${_base}"
license=(MIT)
depends=(python-trame-client python-plotly)
makedepends=(python-build python-installer python-hatchling nodejs npm)
checkdepends=(python-pytest)
optdepends=('python-plotly: for Plotly integration')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1e9c68cf4fd3f2388b5ef30ef2d9e1dc4301c82da8b025592a30e8c691dfb808a0498e335cd441c235d9ac1ed28cba518aab8ed029767192e51b60ef238d85ed')

build() {
  cd ${srcdir}/${_base}-${pkgver}/vue-components
  npm install
  npm run build

  cd ${srcdir}/${_base}-${pkgver}
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

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm ${pkgdir}${site_packages}/trame/__init__.py
  rm ${pkgdir}${site_packages}/trame/modules/__init__.py
  rm ${pkgdir}${site_packages}/trame/widgets/__init__.py
}
