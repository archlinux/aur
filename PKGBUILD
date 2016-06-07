# Maintainer: Cedric Girard <girard.cedric@gmail.com>

_proj=rarfile
_python=python2 _pyver=2
#_python=python3 _pyver=""
pkgname="$_python-$_proj"
pkgver=2.8
pkgrel=1
pkgdesc="Rar archive reader for Python"
arch=(any)
url="https://pypi.python.org/pypi/$_proj"
license=(custom:ISC)
makedepends=("python$_pyver")

# These only required to build the documentation:
makedepends+=(python-docutils "python$_pyver-sphinx")

depends=("python$_pyver")
optdepends=(
  "unrar: Decompressing compressed files"
  'libarchive: Alternative to "unrar"'
  "python$_pyver-crypto: Parsing encrypted headers"
)
provides=("python-$_proj")
source=(
  "https://pypi.io/packages/source/r/$_proj/$_proj-$pkgver.tar.gz"
)
md5sums=('98942f9c51468ca044738fe2e96fdd2d')

build() {
  cd "$srcdir/$_proj-$pkgver"
  "$_python" setup.py build
  make html SPHINXBUILD="sphinx-build$_pyver" BUILDDIR="_build-$pkgname"
}

package() {
  cd "$srcdir/$_proj-$pkgver"
  "$_python" setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 README.html "$pkgdir/usr/share/doc/$pkgname/README.html"
  cp -a "doc/_build-$pkgname/html" "$pkgdir/usr/share/doc/$pkgname/"
}
