# Maintainer: Muflone <webreg@vbsimple.net>
# Contributor: SergHeart
# Contributor: Matthew Bauer <mjbauer95@gmail.com>

pkgname=python2-gudev-git
_gitname=python-gudev
pkgver=147.2.1.g780b007
pkgrel=2
pkgdesc="Python (PyGObject) bindings to the GUDev library"
arch=('i686' 'x86_64')
url="http://github.com/nzjrs/python-gudev"
license=('LGPL3')
depends=('systemd' 'python2')
makedepends=('git')
provides=("python2-gudev" "python-gudev")
conflicts=("python2-gudev" "python-gudev")
replaces=('conduit-svn')
source=("git://github.com/nzjrs/python-gudev.git"
        "configure.patch"
        "makefile.patch")
md5sums=('SKIP'
         '0ab9c9f78c88023b86703d503630da10'
         '5e610a3a114df81b8598d91e2ed46f30')
sha1sums=('SKIP'
          'f12d3a0849205d55b43106d3bc088a89ce21d290'
          '517dd3bbe346b1627745d1dc5affc04786b16ec1')
sha256sums=('SKIP'
            '5db0bd5945e6564cb8c602a5f3b63168b85e483eccf286ed294e6df571c3f62b'
            'e3b6be0db49b4f90d2e89fbb4dff0f194d8514a2d1577ee81a76c5e4dc2e50bc')
options=('!libtool')

pkgver() {
  cd "${_gitname}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "${_gitname}"
  patch -p1 -i ../configure.patch
  patch -p1 -i ../makefile.patch
}

build() {
  cd "${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr PYTHON=python2
  sed -i '/#include <pygobject\.h>/ i#include <python2.7/Python.h>' "gudevmodule.c"
  make
}

package() {
  cd "${_gitname}"
  make DESTDIR="${pkgdir}" install
}

