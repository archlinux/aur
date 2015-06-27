# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <vratil@progdansoft.com>
pkgname=lib32-tinyxml
pkgver=2.6.2
pkgrel=5
pkgdesc="A simple, small, C++ XML parser that can be easily integrated into other programs (32 bit)"
arch=('x86_64')
url='http://www.grinninglizard.com/tinyxml/'
license=('zlib')
depends=('lib32-gcc-libs' 'tinyxml')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/tinyxml/tinyxml_${pkgver//./_}.tar.gz")
md5sums=('c1b864c96804a10526540c664ade67f0')

prepare() {
  cd "$srcdir/tinyxml"

  # Fix Makefile
  sed -i 's|^TINYXML_USE_STL.*|TINYXML_USE_STL:=YES|' Makefile
  sed -i "s|^RELEASE_CFLAGS.*|RELEASE_CFLAGS:=$CXXFLAGS -fPIC -m32|" Makefile
  sed -i "s|^RELEASE_LDFLAGS.*|RELEASE_LDFLAGS:=$LDFLAGS -m32|" Makefile
}

build() {
  cd "$srcdir/tinyxml"

  make
  g++ -m32 -fPIC "$CXXFLAGS" -shared -o libtinyxml.so.0.${pkgver} -Wl,-soname,libtinyxml.so.0  $(ls *.o | grep -v xmltest)
}

package() {
  cd "$srcdir/tinyxml"

  install -D -m755 libtinyxml.so.0.$pkgver "$pkgdir"/usr/lib32/libtinyxml.so.0.$pkgver

  cd ${pkgdir}/usr/lib32
  ln -s libtinyxml.so.0.${pkgver} libtinyxml.so.0
  ln -s libtinyxml.so.0.${pkgver} libtinyxml.so
}
