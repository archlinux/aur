# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-filelock
pkgver=3.2.1
pkgrel=3
pkgdesc='A platform independent file lock'
url='https://github.com/benediktschmitt/py-filelock'
_name=${url##*-}
license=('custom:Unlicense')
arch=('any')
depends=('python2')
makedepends=('python2-setuptools-scm')
checkdepends=('python2-pytest' 'python2-pytest-timeout')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('9bb3a841fb7629eb39edfff49c936b387d7f4288341c4c0de525a16b7cb01153')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Make python2-pytest-cov no longer a requirement
  sed -i /-cov/d setup.cfg
}

build() {
  cd "$srcdir/$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python2 setup.py build
}

check() {
  cd "$srcdir/$_name-$pkgver"
  PYTHONPATH=src python2 -m pytest
}

package() {
  cd "$srcdir/$_name-$pkgver"
  SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" \
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
