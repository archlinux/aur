# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenics-plotly
pkgname=python-${_base}
pkgdesc="A package for plotting FEniCS objects using plotly"
pkgver=2025.0.0
pkgrel=1
arch=(any)
url="https://github.com/finsberg/${_base}"
license=(MIT)
depends=(python-dolfin python-ipywidgets python-plotly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bdbdab190f478a64e1f3c77964bde7d32e90fc98f99e6454fb481b07af2459fe8afe192d31b848bca73675aa3483d38fff41c3a01ab02c93f01a7c9f14da51f5')

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
  test-env/bin/python tests/test_fenics_plotly.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
