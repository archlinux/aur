# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Giorgio Lando <patroclo7@gmail.com>
# Contributor: Nicolas Quienot <niQo@aur>
# Contributor: Jesse Young <jesse.young@gmail.com>
# Contributor: Anton Eliasson <devel@antoneliasson.se>

pkgbase=pypy-httplib2
pkgname=(pypy-httplib2 pypy3-httplib2)
pkgver=0.17.0
pkgrel=1
pkgdesc='Small, fast HTTP client library'
url='https://github.com/httplib2/httplib2'
license=('MIT')
arch=('any')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
depends=('ca-certificates')
provides=('httplib2') # Should I get rid of this?
replaces=('httplib2') # Or this?
source=("httplib2_sources::https://github.com/httplib2/httplib2/archive/v$pkgver.tar.gz")
sha256sums=('556aa045aefeed3fd58a003251c94627e077ab0732758e5178a0074d9c75a68b')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup httplib2-$pkgver pypy3httplib2-$pkgver
}

build() {
  # build for pypy
  cd httplib2-$pkgver
  pypy setup.py build

  # build for pypy3
  cd ../pypy3httplib2-$pkgver
  pypy3 setup.py build
}

package_pypy-httplib2() {
  depends=('pypy')
  pkgdesc+=" for Pypy"

  cd httplib2-$pkgver
  pypy setup.py install -O1 --root="$pkgdir" --prefix=/opt/pypy
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_pypy3-httplib2() {
  depends=('pypy3')
  pkgdesc+=" for Pypy 3"

  cd pypy3httplib2-$pkgver
  pypy3 setup.py install -O1 --root="$pkgdir" --prefix=/opt/pypy3
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
