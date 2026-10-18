# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

_pkgname=mypy_zope
pkgname=python-mypy-zope
pkgver=1.0.17
pkgrel=1
pkgdesc="Plugin for mypy to support zope.interface"
arch=('any')
url="https://pypi.org/project/mypy-zope/"
license=('MIT')
depends=('python' 'mypy' 'python-zope-interface' 'python-zope-schema')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('4005245c2876f7de54a4eb86e470909c588c2955ad7b73914b36a57bcf469f12')

# mypy needs the built package on PYTHONPATH to import the plugin and to
# find the bundled zope stubs.
check() {
  cd "$srcdir/mypy_zope-$pkgver"
  PYTHONPATH=./build/lib python -m pytest
  PYTHONPATH=./build/lib python -m mypy --strict ./src/mypy_zope
}

build() {
  cd "$srcdir/mypy_zope-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/mypy_zope-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
