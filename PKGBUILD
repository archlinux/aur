# Maintainer: Jose Riha <jose 1711 gmail com>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>

_base=textual
pkgname=python-${_base}
pkgver=0.4.0
pkgrel=1
pkgdesc="Text User Interface using Rich"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-nanoid)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-aiohttp python-msgpack python-jinja python-syrupy python-click python-time-machine python-pytest-aiohttp python-pytest-asyncio)
optdepends=('python-aiohttp: for HTTP server'
  'python-click: for click event as mouse button'
  'python-msgpack: for MessagePack serializer')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('603bec05956d07c0a2079f1219a191b54ffc9605f11815a4089c778c2b83906faf930e659cb3d2990fe4fc2e7a630a24258cf02465c7e00713defd31990284f2')

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
