# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: jmdana <dana.develop@gmail.com>

_base=textual
pkgname=python-${_base}-git
pkgver=0.33.0.r23.g900c372f1
pkgrel=1
pkgdesc="Modern Text User Interface framework"
arch=(any)
url="https://github.com/Textualize/${_base}"
license=(MIT)
depends=(python-rich python-importlib-metadata python-typing_extensions)
makedepends=(python-build python-installer python-poetry-core git)
checkdepends=(python-pytest-aiohttp python-pytest-asyncio python-click
  python-time-machine python-linkify-it-py)
optdepends=('python-aiohttp: for HTTP server'
  'python-click: for click event as mouse button')
source=(git+${url}.git#branch=main)
sha512sums=('SKIP')
provides=(python-${_base})
conflicts=(python-${_base})

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
  test-env/bin/python -m pytest \
    --ignore=tests/snapshot_tests/test_snapshots.py \
    --ignore=tests/test_widget.py \
    --ignore=tests/devtools/test_redirect_output.py \
    --ignore=tests/devtools/test_devtools.py \
    --ignore=tests/devtools/test_devtools_client.py \
    -k 'not textual_env_var'
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
