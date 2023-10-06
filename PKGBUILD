# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsx-plotly
pkgname=python-${_base}
pkgdesc="Lightweight library for plotting FEniCS x objects using plotly"
pkgver=0.3.0
pkgrel=1
arch=(any)
url="https://github.com/finsberg/${_base}"
license=(MIT)
depends=(python-fenics-dolfinx python-ipywidgets python-plotly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('456fa4e617b233a5bd28768c0e99812c730ae01a2c9937ef3ffa0f529cf82372b5e3d8596cb4bab7630d835e8f4abdfc58e30d26e08576c83333c58b9859e016')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi

  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python tests/test_fenicsx_plotly.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
