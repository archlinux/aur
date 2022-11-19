# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python38-pep621
pkgver=0.6.1
pkgrel=1
pkgdesc='PEP 621 metadata parsing'
arch=('any')
url='https://github.com/FFY00/python-pep621'
license=('MIT')
depends=('python38-packaging')
makedepends=('git' 'python38-build' 'python38-installer' 'python38-setuptools' 'python38-wheel'
             'python38-sphinx' 'python38-sphinx-autodoc-typehints' 'python38-sphinx-furo')
checkdepends=('python38-pytest' 'python38-tomli')
source=("git+$url#tag=$pkgver?signed")
validpgpkeys=('3DCE51D60930EBA47858BA4146F633CBB0EB4BF2') # Filipe Laíns (FFY00) <lains@archlinux.org>
sha512sums=('SKIP')

prepare() {
  echo 'from setuptools import setup; setup()' >$pkgname/setup.py
}

build() {
  cd $pkgname

  python3.8 -m build -nw

  PYTHONPATH=. sphinx-build -b dirhtml -v docs docs/build/html
}

check() {
  cd $pkgname

  python3.8 -m pytest
}

package() {
  cd $pkgname

  python3.8 -m installer -d "$destdir" dist/*.whl

  install -dm 755 "$pkgdir"/usr/share/doc/$pkgname
  cp -r -a --no-preserve=ownership docs/build/html "$pkgdir"/usr/share/doc/$pkgname
  rm -rf "$pkgdir"/usr/share/doc/$pkgname/html/.doctrees

  install -Dm 644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
