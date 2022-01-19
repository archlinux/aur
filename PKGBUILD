# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>
_base=meshplex
pkgname=python-${_base}
pkgdesc="Fast tools for simplex meshes"
pkgver=0.17.0
pkgrel=1
arch=('any')
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshio python-npx)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-meshzoo python-matplotlib python-scipy)
optdepends=('python-matplotlib: for Matplotlib rendering'
  'python-scipy: for analyze the connected components of a sparse graph'
  'vtk: for create polygonal sphere'
)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('eb9beb17b50c22445a1daeaacbb53faebe7a240c931e6bd238116dc19e1f1766b0a21f2750e44f7da9537bf1fa110f90bbcf733792d330a46dde163830a0a153')

build() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "${_base}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest -k 'not mesh_tri' --codeblocks tests
}

package() {
  cd "${_base}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
