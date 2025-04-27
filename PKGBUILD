# Maintainer: Fernando Ortiz <nandub+arch@nandub.info>
# Contributor: Michael Beasley <youvegotmoxie@gmail.com>

pkgbase=pypy-lxml
pkgname=('pypy-lxml' 'pypy3-lxml')
pkgver=5.4.0
pkgrel=1
pkgdesc="The lxml XML toolkit is a Pythonic binding for the C libraries libxml2 and libxslt"
license=('BSD')
arch=('i686' 'x86_64')
makedepends=('libxslt' 'pypy3' 'pypy3-setuptools')
url="http://lxml.de/"
source=(https://pypi.python.org/packages/source/l/lxml/lxml-${pkgver}.tar.gz)
sha256sums=('d12832e1dbea4be280b22fd0ea7c9b87f0d8fc51ba06e92dc62d52f804f78ebd')

prepare() {
  # copy folder, so we can cleanly build for both python versions
  cp -rup lxml-$pkgver pypy3lxml-$pkgver
}

build() {
  # build for pypy
  cd lxml-$pkgver
  pypy setup.py build

  # build for pypy3
  cd ../pypy3lxml-$pkgver
  pypy3 setup.py build
}

package_pypy-lxml() {
   depends=('pypy' 'libxslt')
   pkgdesc+=" for Pypy"

   cd lxml-$pkgver
   pypy setup.py install --prefix=/opt/pypy --root="$pkgdir" --optimize=1
   install -Dm644 LICENSES.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_pypy3-lxml() {
  depends=('pypy3' 'libxslt')
  pkgdesc+=" for Pypy 3"

  cd pypy3lxml-$pkgver
  pypy3 setup.py install --prefix=/opt/pypy3 --root="$pkgdir" --optimize=1
  install -Dm644 LICENSES.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
