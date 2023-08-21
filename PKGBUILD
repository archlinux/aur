# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=syrupy
pkgname=python-${_base}
pkgdesc="Pytest Snapshot Test Utility"
pkgver=4.2.0
pkgrel=1
arch=(any)
url="https://github.com/tophat/${_base}"
license=(Apache)
depends=(python-pytest python-colored)
makedepends=(python-build python-installer python-poetry-core)
checkdepens=()
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('ceae95698185c4f4067cb76ada82d41b644ed51fe7ead2419f0090faf47a83488782e2227886e69b6ecdb378fb218ee648f379a1193406bece447191384c85f3')

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
