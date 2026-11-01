# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-modelrunner
pkgname=python-${_base}
pkgdesc="Python classes for organizing (HPC) simulations"
pkgver=0.20.3
pkgrel=1
arch=(any)
url="https://github.com/zwicker-group/${_base}"
license=(MIT)
depends=(python-jinja python-numpy python-tqdm python-numcodecs)
makedepends=(python-build python-installer python-setuptools-scm)
# checkdepends=(python-pytest python-zarr)
optdepends=('python-h5py: storing data in the hierarchical file format'
  'python-pandas: creating pandas dataframe summarizing the data'
  'python-yaml: for stores data in a YAML'
  'python-zarr: for stores data in a Zarr')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('566aaca56eea430a5f04d41885ce6eb27205d4e10616aee4e6b1432c6356a267e4b3341d56d90591e59c0eac58028238d4a3febc74ce8d08b924aea2f5b0df2a')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}/scripts
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer ../dist/*.whl
#   test-env/bin/python run_tests.py --unit
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base/-/_}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
