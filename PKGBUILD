# Maintainer: envolution
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=webargs
pkgname=python-$_pkgname
pkgver=8.7.1
pkgrel=1
pkgdesc='A friendly library for parsing HTTP request arguments, with built-in support for popular web frameworks'
arch=('any')
url='https://github.com/marshmallow-code/webargs'
license=('MIT')
depends=('python-marshmallow')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit-core'
  'python-sphinx' 'python-sphinx-issues'
  'python-sphinx-furo')
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
sha512sums=('124597165b4624b95c1ac1b29e2f6afd8ccd78e0957af1cd31f4598f34e3aeb46f8e0d3c4aab3aa45d7baa660f63ea991a43b09d987861bfb588f9e5987955d7')

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

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -a --no-preserve=mode,ownership docs/_build/html -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 docs/_build/man/webargs.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
