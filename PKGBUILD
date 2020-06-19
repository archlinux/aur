# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Ben <ben@benmazer.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gtkglext-pangox
pkgver=1.2.0
pkgrel=1
pkgdesc="opengl extensions for gtk2, with pangox"
arch=('x86_64')
url="http://gtkglext.sourceforge.net/"
license=('LGPL')
depends=('gtk2' 'glu' 'libxmu' 'pangox-compat')
makedepends=('python')
conflicts=(${pkgname%-pangox})
provides=(${pkgname%-pangox})
source=("https://downloads.sourceforge.net/sourceforge/gtkglext/${pkgname%-pangox}-${pkgver}.tar.bz2"
	'gtk2.20.patch' gtkglext-gcc8.patch)
sha256sums=('16bd736074f6b14180f206b7e91263fc721b49912ea3258ab5f094cfa5497f51'
            '864c6963c4a2f4f69f1f028ecee6c821a4f4d5aba142f2e07898aede825ce9ea'
            '0ec0c22b15054b0684f9a9015ff05920af0c00dae5409e76321f683dcc17cff9')

prepare() {
  cd ${pkgname%-pangox}-$pkgver

  patch -Np1 -i "${srcdir}/gtk2.20.patch"
  sed '/AC_PATH_XTRA/d' -i configure.in  
  patch -p1 -i ../gtkglext-gcc8.patch # Fix build with GCC 8

  autoreconf -vi
}
  
build() {
  cd ${pkgname%-pangox}-$pkgver

  ./configure --prefix=/usr \
              --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd ${pkgname%-pangox}-$pkgver
  make DESTDIR="${pkgdir}" install
}
