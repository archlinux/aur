# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>
_base=dmsh
pkgname=python-${_base}
pkgver=0.2.19
pkgrel=1
pkgdesc="Simple mesh generator inspired by distmesh"
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-meshplex python-scipy)
makedepends=(python-build python-flit-core python-install)
optdepends=('python-matplotlib: for plotting')
checkdepends=(python-perfplot python-pytest-codeblocks)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5c363aec1be124b2e4b13f0157fe92910d2e04f9723f5dd06e7d7c49ee4b2b8330f3598e8bf6e2cfe58c8b4f2bc071e090e12f39d53ee11823f9d00edd4f547e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks tests
}

package() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-$pkgver.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
