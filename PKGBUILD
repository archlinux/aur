# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.19.1
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-exceptiongroup python-aiohttp python-msgpack python-jinja python-syrupy python-click python-time-machine)
# python-pytest-aiohttp python-pytest-asyncio
optdepends=('python-aiohttp: for HTTP server'
  'python-click: for click event as mouse button'
  'python-msgpack: for MessagePack serializer')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('eb1573c7a1111f63e64b0febe3136713ab4adc72fc858c1911e31e960937dd43bdd549eb97af39d46853436f8ccb5d8cae945fb6959bd7db176cf822c58b8508')

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
    --ignore=tests/test_widget.py \
    --ignore=tests/devtools/test_devtools.py \
    --ignore=tests/devtools/test_redirect_output.py \
    --ignore=tests/devtools/test_devtools_client.py
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
