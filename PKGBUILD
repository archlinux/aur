# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=9.2.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL-3.0-or-later)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py-openmpi python-tensortrax
  python-pyvista hdf5-openmpi fmt verdict libxcursor glew xorg-server-xvfb)
optdepends=('python-einsumt: for parallel assembly'
  'python-h5py-openmpi: for XDMF result files'
  'python-matplotlib: plotting graphs'
  'python-meshio: for mesh-related I/O'
  'python-pyvista: for interactive visualizations'
  'python-tensortrax: for automatic differentiation support'
  'python-jax: for automatic differentiation support'
  'python-tqdm: for showing progress bars during job evaluation')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('71c665f0a567a02c0d7e1a726ca4936417e652c74132b5525c9e024d193f678a1bd7755b2243a5f462d56b6691145824151c2c38eb18a388c6f58cc9df4cdffb')

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
