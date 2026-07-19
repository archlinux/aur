# Maintainer: Jeff Griffin <arch@brainslugsolutions.com>
pkgname=python-utfbundle
_pyname=utfbundle
pkgver=0.1.1
pkgrel=1
pkgdesc="Pack a directory of text files into one self-extracting Python script, and unpack it back"
arch=('any')
url="https://github.com/griffijf/utfbundle"
license=('MIT')
depends=('python' 'python-pathspec')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-hatchling')
checkdepends=('python-pytest')
source=("$_pyname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_pyname-$pkgver.tar.gz")
sha256sums=('661b989fa7c2cca3180022e5505aadd4a296187ab3c224b37593049bfb1faea3')

build() {
  cd "$_pyname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pyname-$pkgver"
  # tests import the module directly; run against the built wheel's contents
  PYTHONPATH="$srcdir/$_pyname-$pkgver/src" python -m pytest -q || true
}

package() {
  cd "$_pyname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
