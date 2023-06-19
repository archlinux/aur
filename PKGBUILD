# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.28.0
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
sha512sums=('fc38b67c56adb7c46d138ede4231cff032cba1c1f875204826cba0ce198e5f8437d695b05bd006e135e9d75fbe503ce54f86cd25184ea340513f6ac647dd9245')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  ln -s "${site_packages}/${_base}-${pkgver}.dist-info/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
