# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgname=python2-zc.lockfile
_name=${pkgname#python2-}
pkgver=2.0
pkgrel=8
pkgdesc='Zope testing frameworks (Python 2 package)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('custom:ZPL')
depends=('python2')
makedepends=('python2-setuptools')
optdepends=('python2-zope-testing: for check() function during build')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/zopefoundation/${_name}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('bdb429c506064a83cb6fe0964aef6793cc20b5c954c208497a2c3d596213687b40be6d778490d3317de87ff997dfcfc9357f6e5225f48636148f1acdc9325350')

_isinstalled() {
  pacman --deptest $1 > /dev/null
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  ( _isinstalled 'python2-zope-testing' ) || echo 'Skipping testing: python2-zope-testing not installed'; return 0

  cd "${_tarname}"
  python2 setup.py test -q
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm 644 'LICENSE.txt' "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
