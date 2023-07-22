# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=syrupy
pkgname=python-${_base}
pkgdesc="Pytest Snapshot Test Utility"
pkgver=4.0.8
pkgrel=1
arch=(any)
url="https://github.com/tophat/${_base}"
license=(Apache)
depends=(python-pytest python-colored)
makedepends=(python-build python-installer python-poetry-core)
checkdepens=()
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('82638f66b7ce742e64b8c058ac3d5f51ea326096cc3ab47be23c951203c8e6569c67af8c4dd90cbd5c0e04a754d80a8f2cb090a7083303746878fcd8239a887d')

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
