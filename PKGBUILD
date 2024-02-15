# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=7.17
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy python-tensortrax)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py-openmpi python-tensortrax
  python-pyvista hdf5-openmpi fmt verdict libxcursor glew xorg-server-xvfb)
optdepends=('python-einsumt: for parallel assembly'
  'python-h5py-openmpi: for XDMF result files'
  'python-matplotlib: plotting graphs'
  'python-meshio: for mesh-related I/O'
  'python-pyvista: for interactive visualizations'
  'python-tqdm: for showing progress bars during job evaluation')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0c8fd8ce420c5518de576cd635723eeb333d5e6a352302a8def819f75a1d55ed6ff092b7eaecd0ed34eab16c45e565036479921de7ebc687b699e5d266345c33')

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
