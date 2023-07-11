# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual
pkgname=python-${_base}
pkgver=0.29.0
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-asyncio python-pytest-aiohttp python-time-machine)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a7692fb30596f3489dc64393d2fe01225d3270d288592a6d32d656ad2763337b2f11cfe23243635da3650752eb51e65664fd70ac34bbe228bcfd0566cec8d680')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/snapshot_tests/test_snapshots.py \
    --ignore=tests/test_markdown.py \
    -k 'not textual_env_var'
}

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
