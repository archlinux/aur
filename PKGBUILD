# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Cedric Girard <girard.cedric@gmail.com>

_proj=rarfile
#_python=python2 _pyver=2
_python=python _pyver=""
pkgname="$_python-$_proj"
pkgver=3.0
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
md5sums=('d7e9a8b429f5604730400b4db3362038')

build() {
  cd "$srcdir/$_proj-$pkgver"
  "$_python" setup.py build
  cd doc
  make html SPHINXBUILD="sphinx-build$_pyver" BUILDDIR="_build-$pkgname"
}

package() {
  cd "$srcdir/$_proj-$pkgver"
  "$_python" setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d -m755 "$pkgdir/usr/share/doc/$pkgname"
  cp -a "doc/_build-$pkgname/html" "$pkgdir/usr/share/doc/$pkgname/"
}
