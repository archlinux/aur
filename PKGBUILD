# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=6.2.5
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py python-matplotlib) # python-tensortrax
optdepends=('python-meshio: for export mesh'
  'python-h5py: for XDMF-export'
  'python-numba: for JIT compiler support'
  'python-sparse: for sparse arrays support'
  'python-einsumt: for multithreaded numpy.einsum support'
  'python-tensortrax: for automatic differentiation support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('6b19c716e61ae6c66e6600c7ca324fad1cafc4d344c63f3e4cdaff14a8db8180183e4dbb19ba92cbedf09a84c77609c145c60e992f38f705006f229cba3501b2')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not form and not mechanics and not mpc and not newton and not umat_hyperelastic'
}

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
