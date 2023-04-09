# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=webargs
pkgname=python-$_pkgname
pkgver=8.2.0
pkgrel=3
pkgdesc='A friendly library for parsing HTTP request arguments, with built-in support for popular web frameworks'
arch=('any')
url='https://github.com/marshmallow-code/webargs'
license=('MIT')
depends=('python-marshmallow')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx-issues' 'python-sphinx-typlog-theme' 'python-sphinx-furo')
checkdepends=('python-pytest-runner' 'python-webtest' 'python-pytest-aiohttp' 'python-webtest-aiohttp'
              'python-bottle' 'python-werkzeug' 'python-django' 'python-flask' 'python-tornado' 'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('9fc223b70333afe0985ff90648d6f59c94c97b87386df156038e3a6f7c0ac59526181d0a20107df6e060fe0fc9750de9144cbf2c07011cd54840000758eeedd5')

prepare() {
  cd $_pkgname-$pkgver

  rm tests/test_{falcon,pyramid}parser.py
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
