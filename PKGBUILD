# Maintainer: Pablo Palazon <ppalazon@phyxor.com>
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

_pkgname=okonomiyaki
pkgname=python-$_pkgname
pkgver=3.0.0
pkgrel=1
pkgdesc='Experimental library aimed at consolidating a lot of our low-level code used for Enthought eggs'
arch=('any')
url='https://github.com/enthought/okonomiyaki'
license=('MIT')
depends=('python' 'python-packaging' 'python-attrs' 'python-jsonschema' 'python-distro')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('0ab2fd56ee8bd62e65028992ab3957602700f189080d160d6aa1788a292f683860867e1142217abfdc79f5b18b3d5026d4f6c92a5b0cc7df19fe4295b1d9bbdc')

build() {
  cd $_pkgname-$pkgver

  find -type f -name '*.py' -exec sed -i 's|zipfile2|zipfile|' '{}' +
  sed -i /zipfile2/d setup.py

  python -m build -nw
}

check() {
  cd $_pkgname-$pkgver

  python -c "from okonomiyaki.versions import EnpkgVersion"
  python -c "from okonomiyaki.platforms import EPDPlatform"
  python -c "from okonomiyaki.file_formats import EggMetadata"
}

package() {
  cd $_pkgname-$pkgver

  python -m installer -d "$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
