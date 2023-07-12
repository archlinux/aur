# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=syrupy
pkgname=python-${_base}
pkgdesc="Pytest Snapshot Test Utility"
pkgver=4.0.6
pkgrel=1
arch=(any)
url="https://github.com/tophat/${_base}"
license=(Apache)
depends=(python-pytest python-colored)
makedepends=(python-build python-installer python-poetry-core)
checkdepens=()
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f087d06415d12840de53df8a18c8505b5d65fc4e8597b77a892fbc8020b6f5b8e9d299ab4a199ab25fbbee0bfde1977a871f1aec717aa1379b69f5b607cf815a')

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
