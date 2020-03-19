# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Sergej Pupykin <sergej@aur.archlinux.org>
# Contributor: Douglas Soares de Andrade <dsandrade@gmail.com>

pkgbase=pypy-urwid
pkgname=('pypy-urwid' 'pypy3-urwid')
pkgver=2.1.0
pkgrel=1
pkgdesc="Console user interface library"
license=('LGPL')
arch=('i686' 'x86_64')
makedepends=('pypy-setuptools' 'pypy3-setuptools')
url="http://excess.org/urwid/"
source=(https://pypi.python.org/packages/source/u/urwid/urwid-$pkgver.tar.gz)
sha256sums=('0896f36060beb6bf3801cb554303fef336a79661401797551ba106d23ab4cd86')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup urwid-$pkgver pypy3urwid-$pkgver
}

build() {
  # build for pypy
  cd urwid-$pkgver
  sed -i 's#bin/python#bin/pypy#' urwid/*.py
  pypy setup.py build

  # build for pypy3
  cd ../pypy3urwid-$pkgver
  sed -i 's#bin/python#bin/pypy3#' urwid/*.py
  pypy3 setup.py build
}

package_pypy-urwid() {
   depends=('pypy')
   pkgdesc+=" for Pypy"

   cd urwid-$pkgver
   pypy setup.py install --prefix=/opt/pypy --root="$pkgdir" --optimize=1
}

package_pypy3-urwid() {
  depends=('pypy3')
  pkgdesc+=" for Pypy 3"

  cd pypy3urwid-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
}
