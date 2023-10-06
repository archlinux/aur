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
sha512sums=('99ad1b55fe484559437531d7ff4f93d81ffa4994b568bbf2131fc8a9f2d19802de1116814cb89f0bd355fe9b27832ec97bfeb4c61bd1ca9a930ed5172d832764')

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
