# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=py-modelrunner
pkgname=python-${_base}
pkgdesc="Python classes for organizing (HPC) simulations"
pkgver=0.20.1
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
sha512sums=('cdbfb6f80d47e1d0be41f39f6a26f5ba5cc57687c511d95a23290be9b1f8950eedb416044377eef8c4a865dbd13cfb8be0d4f26b6e4300a274e5dbdab3cdf3a4')

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
