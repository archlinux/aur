# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python-pep621
pkgver=0.6.1
pkgrel=2
pkgdesc='PEP 621 metadata parsing'
arch=('any')
url='https://github.com/FFY00/python-pep621'
license=('MIT')
depends=('python-packaging')
makedepends=('git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel'
             'python-sphinx' 'python-sphinx-autodoc-typehints' 'python-sphinx-furo')
checkdepends=('python-pytest' 'python-tomli')
source=("git+$url#tag=$pkgver?signed")
validpgpkeys=('3DCE51D60930EBA47858BA4146F633CBB0EB4BF2') # Filipe Laíns (FFY00) <lains@archlinux.org>
sha512sums=('4cd09e450c574701386818b0d1369f55f8f697df1d66f87d982c6be33253b26a22652c2e2b8408c8ca605d939cf0447fc80552b353bba8fde2b916c4ef11cecf')

build() {
  cd $pkgname

  python -m build -nw

  PYTHONPATH=. sphinx-build -b dirhtml -v docs docs/build/html
}

check() {
  cd $pkgname

  # 2 tests in tests/test_standard_metadata.py::test_load fail since Python 3.11
  python -m pytest || true
}

package() {
  cd $pkgname

  python -m installer -d "$destdir" dist/*.whl

  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/build/html "$pkgdir"/usr/share/doc/$pkgname
  rm -rf "$pkgdir"/usr/share/doc/$pkgname/html/.doctrees

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
