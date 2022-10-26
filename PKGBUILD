# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jmdana <dana.develop@gmail.com>

_base=textual
pkgname=python-${_base}-git
pkgver=0.2.1.r49.g93e75f3f
pkgrel=1
pkgdesc="Text User Interface using Rich"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata)
makedepends=(python-build python-installer python-poetry-core git)
checkdepends=(python-pytest python-aiohttp python-msgpack python-jinja python-syrupy python-nanoid python-click python-time-machine python-pytest-aiohttp python-pytest-asyncio)
optdepends=('python-aiohttp: for HTTP server'
  'python-click: for click event as mouse button'
  'python-msgpack: for MessagePack serializer'
  'python-nanoid: for generate unique string ID')
source=(git+${url}.git#branch=main)
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
