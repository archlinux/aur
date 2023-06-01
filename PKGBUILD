# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=fenicsprecice
pkgname=python-${_base}
pkgdesc="FEniCS-preCICE adapter is a preCICE adapter for the open source computing platform FEniCS"
pkgver=1.4.0
pkgrel=2
arch=(any)
url="https://github.com/precice/${_base/precice/-adapter}"
license=(LGPL3)
depends=(python-pyprecice python-dolfin python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base/precice/-adapter}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ee5c50fbff18242e9bbee4cdf5a80a2b870c4e96c0f689838a926f33cfb08960a8300b3d8821d55f62ecf9cf8b8a78bd8e3ed9ef5338644240deec61e075e193')

build() {
  if [ -z "$(ldconfig -p | grep libcuda.so.1)" ]; then
    export OMPI_MCA_opal_warn_on_missing_libcuda=0
  fi
  cd ${_base/precice/-adapter}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base/precice/-adapter}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base/precice/-adapter}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
