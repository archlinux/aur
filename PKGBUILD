# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=6.2.2
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
# checkdepends=(python-pytest python-meshio python-h5py python-matplotlib)
optdepends=('python-meshio: for export mesh'
  'python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support'
  'python-einsumt: for multithreaded numpy.einsum support'
  'python-tensortrax: for automatic differentiation support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2e8e443f49160d3f9a0f1049e257211bbe8b11287f9612949c3456df40dd1d24cbf1dcd0260ccf17bfa6e85d01a4295cbf9adaf188168d4af891faf971144182')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest -k 'not form and not mechanics and not mpc and not newton'
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
