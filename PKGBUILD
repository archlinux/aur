# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-modelrunner
pkgname=python-${_base}
pkgdesc="Python classes for organizing (HPC) simulations"
pkgver=0.20.0
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
sha512sums=('196c5f0f39343e87cf70134c107d5367cc8b8fdf1934f05d1e17318fdc2ac622d6e8232861351e641a1f15f5a2c54d7d458aeb9fefa76e5b7e6861c63344a7a1')

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
