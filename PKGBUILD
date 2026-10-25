# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=ddgs
pkgname=python-$_name
pkgver=9.16.1
pkgrel=1
pkgdesc="Dux Distributed Global Search. A metasearch library that aggregates results from diverse web search services."
arch=('any')
url="https://github.com/deedy5/ddgs"
license=('MIT')
depends=('python'
         'python-click'
         'python-primp'
         'python-lxml')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-trio')
optdepends=('python-mcp: mcp'

            'python-fastapi: api'
            'uvicorn: api'
            'python-httptools: api'
            'python-dotenv: api'
            'python-pyyaml: api'
            'python-uvloop: api'
            'python-watchfiles: api'
            'python-websockets: api')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a936fdbc91fe93398e76c06eeb853aa6e45c1326f56a205c484e3f5fc9f6b89')

build() {
  cd "$_name-$pkgver"
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
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname/
}
