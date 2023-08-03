# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=textual
pkgname=python-${_base}
pkgver=0.32.0
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest-asyncio python-pytest-aiohttp python-time-machine)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('89fc24842a2bbe0767037bf276e8c7b23b45944bbf118ce0ff9ef895244e15feab286b14ae86350cb5b63385e43536ab98373d13ef558a40bc15fc5c179066e3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_markdown.py \
    --ignore=tests/snapshot_tests/test_snapshots.py \
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
