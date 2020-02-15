# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=webargs
pkgname=python-$_pkgname
pkgver=5.5.3
pkgrel=1
pkgdesc='A friendly library for parsing HTTP request arguments, with built-in support for popular web frameworks'
arch=('any')
url='https://github.com/marshmallow-code/webargs'
license=('MIT')
depends=('python-marshmallow')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx-issues' 'python-sphinx-typlog-theme')
checkdepends=('python-pytest-runner' 'python-mock' 'python-webtest' 'python-pytest-aiohttp'
              'python-bottle' 'python-werkzeug' 'python-django' 'python-flask' 'python-tornado')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('ce76f4a25538b7cdcd98a8e0548d71d7b405c0561b8ed8b0ee17114f41127ee6b4304d5636da212bfd2fe1a13d12e9ee81515473f7fae7f3973ff2a012e3810b')

prepare() {
  cd $_pkgname-$pkgver

  rm tests/test_{falcon,pyramid,webapp2}parser.py tests/test_py3/test_aiohttpparser{,_async_functions}.py
}

build() {
  cd $_pkgname-$pkgver

  python setup.py build

  cd docs

  make html man
  ls _build/man
  gzip _build/man/webargs.1
}

check() {
  cd $_pkgname-$pkgver

  python setup.py pytest
}

package() {
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/_build/html "$pkgdir"/usr/share/doc/$pkgname

  install -dm 755 "$pkgdir"/usr/share/man/man1
  install -Dm 644 docs/_build/man/webargs.1.gz "$pkgdir"/usr/share/man/man1/webargs.1.gz

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
