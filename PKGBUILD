# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=cplot
pkgname=python-${_base}
pkgdesc="Plot complex functions"
pkgver=0.9.0
pkgrel=4
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotx python-npx)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-networkx) #python-pyvista
optdepends=('python-pyvista: for create an unstructured grid')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f6f8da1e973b714d482fb9623bc030b467bc8b117175fae6f92315ca612dec80a84a7837aabf93a35746dd27bbb20c8cd473307e540b459ef66ceb73e1cad335')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks -k 'not README and not riemann'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m install --optimize=1 --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
