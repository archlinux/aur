# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

_pkgname=freeglut
pkgname=lib32-${_pkgname}-git
pkgver=3.2.1
pkgrel=1
pkgdesc='Provides functionality for small OpenGL programs (32-bit)'
url='http://freeglut.sourceforge.net/'
arch=('x86_64')
license=('MIT')
depends=('lib32-libxi' 'lib32-libxrandr' 'lib32-libgl' 'freeglut')
makedepends=('lib32-mesa' 'lib32-glu' 'lib32-libxxf86vm' 'cmake' 'subversion')
replaces=('lib32-glut')
provides=('lib32-glut' 'lib32-freeglut')
conflicts=('lib32-glut' 'lib32-freeglut')
source=("svn+https://svn.code.sf.net/p/freeglut/code/trunk/freeglut/freeglut")
sha512sums=('SKIP')

pkgver() {
  cd freeglut
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd freeglut
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cmake -Hfreeglut -Bbuild \
    -DFREEGLUT_BUILD_STATIC_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib32 \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build build --target install
  rm -rf "${pkgdir}/usr/include"
  ln -sr "${pkgdir}"/usr/lib32/pkgconfig/{glut,freeglut}.pc
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ${_pkgname}-${pkgver}/COPYING
}

# vim: ts=2 sw=2 et:
