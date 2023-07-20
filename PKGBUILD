# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=felupe
pkgname=python-${_base}
pkgdesc="Finite Element Analysis"
pkgver=7.5.0
pkgrel=1
arch=(any)
url="https://github.com/adtzlr/${_base}"
license=(GPL3)
depends=(python-scipy python-tensortrax)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-meshio python-h5py python-matplotlib python-tensortrax)
optdepends=('python-einsumt: for parallel assembly'
  'python-h5py: for XDMF result files'
  'python-matplotlib: plotting graphs'
  'python-meshio: for mesh-related I/O'
  'python-pyvista: for interactive visualizations'
  'python-tqdm: for showing progress bars during job evaluation')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4cd1f3f655b5a1c12db86229b99f10e08666582549c153a5c4e1e42bf4fba26fe7d0673143cfaa16f77a57bd75af495aa8b5e756c6dc652b80e9ae6a5240ce50')

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
