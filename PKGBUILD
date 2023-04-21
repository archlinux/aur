# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Lance Chen <cyen0312@gmail.com>
pkgname=python2-wheel
_name=${pkgname#python2-}
pkgver=0.37.1
pkgrel=4
pkgdesc="A built-package format for Python, version for Python 2.7"
arch=(any)
url="https://github.com/pypa/wheel"
license=('MIT')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-pytest-cov')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('a82516a039e521100ecdef137f9e44249bf6903f9aff7d368e84ac31d60597f5')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  sed -i 's/_.name/&.lower()/' src/wheel/wheelfile.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
  python2 setup.py egg_info
}

check() {
  cd "$srcdir/$_name-$pkgver"
  PYTHONPATH="$PWD/src" python2 -m pytest -W ignore::DeprecationWarning
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  mv "$pkgdir/usr/bin/wheel" "$pkgdir/usr/bin/wheel2"
}
