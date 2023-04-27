# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=7.2.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy python-tensortrax)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py python-matplotlib python-tensortrax)
optdepends=('python-einsumt: for multithreaded numpy.einsum support'
  'python-h5py: for XDMF-export'
  'python-matplotlib: plotting suport'
  'python-meshio: for export mesh'
  'python-pyvista: for create unstructured grid')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('03a55171037917a790be8d6d76b9e6636a65e18e7c4d22ded84be27f874424dac52a5fcfdf2410160a33c7387d7abc0dc4028eb4f70f6b5a77bb1ce06b581438')

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

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
