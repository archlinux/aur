# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=runloop-api-client
pkgname=python-${_name//-/_}
pkgver=3.0.0
pkgrel=1
pkgdesc='The official Python library for the runloop API.'
arch=('any')
url='https://github.com/runloopai/api-client-python'
license=('MIT')
depends=('python'
         'python-httpx'
         'python-h2'
         'python-pydantic'
         'python-typing_extensions'
         'python-anyio'
         'python-distro'
         'python-sniffio'
         'python-uuid-utils')
makedepends=('python-hatchling'
             'python-hatch-fancy-pypi-readme'
             'python-build'
             'python-installer')
checkdepends=('python-respx'
              'python-pytest'
              'python-pytest-asyncio'
              'python-pytest-timeout'
              'python-time-machine'
              'python-dirty-equals'
              'python-rich'
              'python-pytest-xdist'
              'python-aiohttp'
              'python-httpx-aiohttp'
              'npm'
              'nodejs'
              'lsof')
optdepends=('python-aiohttp: aiohttp'
            'python-httpx-aiohttp: aiohttp')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0603a71d1c011bf1741295c8fb9d298f6a6ce29314cceb207fcb68a9f821c616')

build() {
  cd "${_name//runloop-/}-python-$pkgver"
  python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  export DEFER_PYDANTIC_BUILD=false
  export npm_config_allow_scripts=false
  export npm_config_yes=true
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:benchmark'
  )
  cd "${_name//runloop-/}-python-$pkgver"
  ./scripts/mock --daemon
  local server_pid=$(lsof -t -i tcp:4010)
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests || { kill "${server_pid}"; return 1; }
  kill "${server_pid}"
}

package() {
  cd "${_name//runloop-/}-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
