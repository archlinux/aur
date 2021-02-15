pkgname=python-blackdoc
pkgdesc='Run Black on documentation code snippets'
pkgver=0.3.3
pkgrel=1
url='https://github.com/keewis/blackdoc'
license=('MIT')
arch=('any')
depends=('python-black' 'python-more-itertools')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(
  "https://files.pythonhosted.org/packages/source/b/blackdoc/blackdoc-$pkgver.tar.gz"
)
sha256sums=(
  'b4956bdd3ad21c501cf33129dfe8a63f202e03630b2951ac23b38bbdc435165a'
)

build() {
  cd "blackdoc-$pkgver"
  python setup.py build
}

check() {
  cd "blackdoc-$pkgver"

  # The library uses importlib.metadata to load its version info, so we need
  # the metadata available before we can run the tests.
  python setup.py egg_info -e build/lib
  PYTHONPATH=$PWD/build/lib pytest -v
  rm -r build/lib/blackdoc.egg-info
}

package() {
  cd "blackdoc-$pkgver"
  python setup.py install --skip-build --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # The egg-info generated does not pick up the version and so reports itself
  # as 0.0.0. Move it to the correct place and edit the PKG_INFO details.
  PYVER=$(python -c 'import sys; print("{}.{}".format(*sys.version_info[:2]))')
  cd "$pkgdir/usr/lib/python$PYVER/site-packages/"
  mv "blackdoc-0.0.0-py$PYVER.egg-info" "blackdoc-$pkgver-py$PYVER.egg-info"
  sed -i -e "s/Version: 0.0.0/Version: $pkgver/" "blackdoc-$pkgver-py$PYVER.egg-info/PKG-INFO"
}
