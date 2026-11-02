# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=groq
pkgname=python-$_name
pkgver=1.7.0
pkgrel=2
pkgdesc='The official Python library for the groq API.'
arch=('any')
url='https://github.com/groq/groq-python'
license=('Apache-2.0')
depends=('python'
         'python-httpx'
         'python-pydantic'
         'python-typing_extensions'
         'python-anyio'
         'python-distro'
         'python-sniffio')
makedepends=('python-hatchling'
             'python-hatch-fancy-pypi-readme'
             'python-build'
             'python-installer')
checkdepends=('python-respx'
              'python-pytest'
              'python-pytest-asyncio'
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
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'embedded-openapi-spec.patch')
sha256sums=('574ea693517634fc0a165f229a81e1cfa0b395c72803a63265f4ca1f7615899a'
            '686e975cf8727b5f03b6a63f754554f17691da2466fb153e4ae436a005ed4146')

prepare() {
  cd "$_name-python-$pkgver"
  # Use the OpenAPI spec embedded in scripts/mock, as the spec URL in .stats.yml now returns 403 (backport of upstream 66d3608)
  patch -Np1 -i ../embedded-openapi-spec.patch
}

build() {
  cd "$_name-python-$pkgver"
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
  cd "$_name-python-$pkgver"
  ./scripts/mock --daemon
  local server_pid=$(lsof -t -i tcp:4010)
  PYTHONPATH="$PWD"/src pytest "${pytest_options[@]}" tests || { kill "${server_pid}"; return 1; }
  kill "${server_pid}"
}

package() {
  cd "$_name-python-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
