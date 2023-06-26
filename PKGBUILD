# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.28.1
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-typing_extensions python-aiohttp python-click python-msgpack)
makedepends=(python-build python-installer python-poetry-core)
# checkdepends=(python-pytest python-exceptiongroup python-jinja python-syrupy python-time-machine)
# python-pytest-aiohttp python-pytest-asyncio
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0a9e9a467d69bf307dbf20d1cb2fa50e226254544b374def083fdb672b7fdc50c7457bf83463aad2f3ada5381dc28e95464704297e3c0c7b7ba435ff002b3f4f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest \
#     --ignore=tests/snapshot_tests/test_snapshots.py \
#     --ignore=tests/test_widget.py \
#     --ignore=tests/devtools/test_devtools.py \
#     --ignore=tests/devtools/test_redirect_output.py \
#     --ignore=tests/devtools/test_devtools_client.py
# }

package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
