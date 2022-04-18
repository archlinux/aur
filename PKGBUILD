# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=cplot
pkgname=python-${_base}
pkgdesc="Plot complex functions"
pkgver=0.9.1
pkgrel=1
arch=(any)
url="https://github.com/nschloe/${_base}"
license=(GPL3)
depends=(python-matplotx python-npx)
makedepends=(python-build python-flit-core python-install)
checkdepends=(python-pytest-codeblocks python-networkx) #python-pyvista
optdepends=('python-pyvista: for create an unstructured grid')
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('9fb1f69f29bea1064db6b3e661e06b7f0688bc4dde0c707d55e81260f85d09317c48e889f1d0835c0a139e538a83f6a356fc0591561841b9aba4656739609354')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m install --optimize=1 dist/*.whl
  MPLBACKEND=Agg test-env/bin/python -m pytest --codeblocks
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
