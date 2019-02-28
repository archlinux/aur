# Maintainer: Gabriel Magno <gabrielmagno1@gmail.com>
# Contributor: Michał Pałubicki <maln0ir@gmx.com>

_pkgname=agate-excel
pkgname=python-$_pkgname
pkgver=0.2.2
pkgrel=4
pkgdesc="Adds read support for Excel files (xls and xlsx) to agate"
arch=('any')
url="http://agate-excel.readthedocs.org/"
license=('MIT')
depends=(
    'python'
    'python-agate>=1.5.0'
    'python-xlrd>=0.9.4'
    'python-openpyxl>=2.3.0'
  )
makedepends=(
    'python-setuptools'
    'python-sphinx>=1.2.2'
    'python-sphinx_rtd_theme>=0.1.6'
  )
source=(
    "https://github.com/wireservice/agate-excel/archive/${pkgver}.tar.gz"
    "openpyxl-min_row.patch"
  )
sha256sums=(
    '37acbc114c4c60aa37f908d93a9e9b597c3ba0ee42672f36f7a317f8af8fc581'
    '56bba8744905429040cf8c2d4e343f654d0039c051fafff332fc1002e71ce278'
  )

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # See: https://github.com/wireservice/agate-excel/issues/26
  patch -p1 -i "$srcdir/openpyxl-min_row.patch"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  python setup.py build_sphinx
  mkdir -p "$pkgdir/usr/share/doc"
  cp -rv "$srcdir/$_pkgname-$pkgver/build/sphinx/html" "$pkgdir/usr/share/doc/$_pkgname"
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py test --test-suite=tests
}

# vim:set ts=2 sw=2 et:
