# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

_name=recommonmark
pkgname=python-$_name
pkgver=0.7.1
pkgrel=6
pkgdesc='Markdown parser for docutils'
arch=('any')
url="https://recommonmark.readthedocs.io/"
license=('MIT')
depends=('python' 'python-commonmark' 'python-docutils' 'python-sphinx')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=(https://files.pythonhosted.org/packages/source/r/$_name/$_name-$pkgver.tar.gz
        autostructify-tab_width-fallback.patch)
sha256sums=('bdb4db649f2222dcd8d2d844f0006b958d627f732415d399791ee436a3686d67'
            '0672b55c9bd49d24cfe86cd29fa93d1ebde3f757df606e7aea74ba6e58deff26')

prepare() {
  cd $_name-$pkgver
  patch -Np1 -i ../autostructify-tab_width-fallback.patch
}

build() {
  cd $_name-$pkgver
  python setup.py build
  make -C docs text man
}

check() {
  cd $_name-$pkgver
  PYTHONDONTWRITEBYTECODE=1 pytest --deselect tests/test_sphinx.py
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" license.md
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" \
    README.md CHANGELOG.md docs/_build/text/*.txt
  install -Dm644 -t "$pkgdir/usr/share/man/man1" docs/_build/man/$_name.1
}

# vim:set ts=2 sw=2 et:
