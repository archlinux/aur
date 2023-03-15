# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.15.1
pkgrel=2
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich
  python-importlib-metadata
  python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core)
# checkdepends=(python-pytest python-aiohttp python-msgpack python-jinja python-syrupy python-click python-time-machine) # python-pytest-aiohttp python-pytest-asyncio
optdepends=('python-aiohttp: for HTTP server'
  'python-click: for click event as mouse button'
  'python-msgpack: for MessagePack serializer')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('75a355e1ce64e3a13cc09b418d87cc3e8ad37a78f0c6bf8df5f3493d7233d41dc5b77a749791a6aa92d1560673ce142995c310e4f37a2fb9aa1477857f6075c6')

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
#     --ignore=tests/devtools/test_redirect_output.py \
#     --ignore=tests/devtools/test_devtools.py \
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
