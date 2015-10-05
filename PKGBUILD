# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=libumlib0-svn
pkgver=r1129
pkgrel=1
pkgdesc="Library with common functions used by every UMView module."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.4')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="${pkgname}.install"
source=("svn+http://svn.code.sf.net/p/view-os/code/trunk/xmview-os"
        "${pkgname}.install"
        "${pkgname}.diff")
md5sums=("SKIP"
         "b4165e6142a92d65c8e14479486decc4"
         "c3c17eafbb532433d49e37f9cfabbed7")

pkgver() {
   cd "$srcdir/xmview-os"
   local ver="$(svnversion)"
   printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
   cd $srcdir/xmview-os
   patch -i ../../${pkgname}.diff Makefile.am
}

build(){
   cd "$srcdir/xmview-os"
   autoreconf -i
   if [ "$CARCH" == "x86_64" ]; then
      ./configure --prefix="${pkgdir}/usr" --disable-static
   else
      ./configure --prefix="${pkgdir}/usr" --libdir="${pkgdir}/usr/lib32" --disable-static
   fi
   make
}

package() {
   cd "$srcdir/xmview-os"
   make install
}
