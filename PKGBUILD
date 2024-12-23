# Maintainer: envolution
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=webargs
pkgname=python-$_pkgname
pkgver=8.6.0
pkgrel=3
pkgdesc='A friendly library for parsing HTTP request arguments, with built-in support for popular web frameworks'
arch=('any')
url='https://github.com/marshmallow-code/webargs'
license=('MIT')
depends=('python-marshmallow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core'
  'python-sphinx' 'python-sphinx-issues'
  'python-sphinx-furo')
checkdepends=('python-pytest-runner' 'python-webtest' 'python-pytest-aiohttp' 'python-webtest-aiohttp'
  'python-bottle' 'python-werkzeug' 'python-django' 'python-flask' 'python-tornado' 'python-pytest-asyncio')
optdepends=(
  'python-flask'
  'python-django'
  'python-bottle'
  'python-tornado'
  'python-pyramid'
  'python-falcon'
  'python-aiohttp'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('adaa90803b7f6f3cfeedf7c02b217030b5cc9d52cf7385dcb698808a565c664abe28b1bd087c1c9337669770348ba72abbb45cbb12da92edc89abdc0788efb5b')

prepare() {
  cd $_pkgname-$pkgver

  rm tests/test_{falcon,pyramid}parser.py
}

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation

  # create a temporary virtualenv for docs and tests
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  PATH="$PWD/test-env/bin:$PATH" \
    PYTHONPATH="$(python -c "import site; print(site.getsitepackages()[0])")" \
    make -C docs html man
}

check() {
  cd $_pkgname-$pkgver

  PATH="$PWD/test-env/bin:$PATH" \
    PYTHONPATH="$(python -c "import site; print(site.getsitepackages()[0])")" \
    python -m pytest \
    --deselect tests/test_bottleparser.py::TestBottleParser::test_invalid_json
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -a --no-preserve=mode,ownership docs/_build/html -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 docs/_build/man/webargs.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
