# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=runloop-api-client
pkgname=python-${_name//-/_}
pkgver=1.24.0
pkgrel=1
pkgdesc='The official Python library for the runloop API.'
arch=('any')
url='https://github.com/runloopai/api-client-python'
license=('MIT')
depends=('python' 'python-httpx' 'python-h2' 'python-pydantic' 'python-typing_extensions' 'python-anyio' 'python-distro' 'python-sniffio' 'python-uuid-utils')
makedepends=('python-hatchling' 'python-hatch-fancy-pypi-readme' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-respx' 'python-pytest' 'python-pytest-asyncio' 'python-pytest-timeout' 'python-time-machine' 'python-dirty-equals' 'python-rich' 'python-pytest-xdist' 'python-aiohttp' 'python-httpx-aiohttp' 'npm' 'nodejs')
optdepends=('python-aiohttp: aiohttp' 'python-httpx-aiohttp: aiohttp')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52128395dd5c2bb28c0577dfa1b63f7189c5f89f0426ae7cc1435bccf22614a0')

build() {
  cd "$srcdir"/${_name//runloop-/}-python-$pkgver
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:benchmark'
  )
  cd "$srcdir"/${_name//runloop-/}-python-$pkgver
  trap 'pkill -f steady' EXIT
  ./scripts/mock --daemon
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/${_name//runloop-/}-python-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
