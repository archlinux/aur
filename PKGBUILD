# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ddgs
pkgname=python-$_name
pkgver=9.15.0
pkgrel=1
pkgdesc="Dux Distributed Global Search. A metasearch library that aggregates results from diverse web search services."
arch=('any')
url="https://github.com/deedy5/ddgs"
license=('MIT')
depends=('python' 'python-click' 'python-primp' 'python-lxml' 'python-httpx' 'python-h2' 'python-socksio' 'python-brotli' 'python-brotlicffi' 'python-fake-useragent')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-trio')
optdepends=('python-mcp: mcp' 'python-fastapi: api' 'uvicorn: api' 'python-colorama: api' 'python-httptools: api' 'python-dotenv: api' 'python-pyyaml: api' 'python-uvloop: api' 'python-watchfiles: api' 'python-websockets: api' 'python-fastapi: dht' 'uvicorn: dht' 'python-colorama: dht' 'python-httptools: dht' 'python-dotenv: dht' 'python-pyyaml: dht' 'python-uvloop: dht' 'python-watchfiles: dht' 'python-websockets: dht' 'python-trio: dht')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a01d43dbb29ccfdb463d4a9b4a9114f627b9e050c3b38f99f4551c5ee25bf33')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --deselect tests/cli_test.py::test_books_command
    --deselect tests/ddgs_test.py::test_videos_search
    --deselect tests/ddgs_test.py::test_books_search
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
