# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Carl George < arch at cgtx dot us >
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
pkgname=python2-unittest2
_name="${pkgname#python2-}"
pkgver=1.1.0
pkgrel=8
pkgdesc='Backports of the unittest module'
arch=('any')
url="http://www.voidspace.org.uk/python/articles/unittest2.shtml"
license=('BSD')
depends=('python2-six' 'python2-traceback2')
makedepends=('python2-setuptools')
_pypi='https://pypi.python.org'
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'LICENSE')
sha256sums=('22882a0e418c284e1f718a822b3b022944d53d2d908e1690b319a9d3eb2c0579'
            'e0bfff5f29a59d078142b8b24b60b0105043057b9e238974d26ae778804ba9bc')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove "argparse" dependency (it's actually a standard library)
  sed -ri 's-.argparse.(,|\s)*--' setup.py

  # Remove trial to import "builtins", it's specific to Python 3
  # and it makes one test fail when a package with that name exists
  sed -ri '1,14{N;N;s-^\s+|.*import\s+builtins.*--}' \
    unittest2/test/test_discovery.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  python2 -m unittest2 discover -v -t . -s unittest2/test/
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.txt "$pkgdir/usr/share/doc/$pkgname/README.txt"
}
