# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=umview-svn
pkgver=r1129
pkgrel=1
pkgdesc="User-mode implementation of View-OS."
arch=('x86_64' 'i686')
url="https://www.sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.15'
         'libumlib0-svn')
optdepends=('umview-mod-umlwip-svn: module for umview networking')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="$pkgname.install"
source=("svn+http://svn.code.sf.net/p/view-os/code/trunk/xmview-os"
        "${pkgname}.install")
md5sums=("SKIP"
         "b4165e6142a92d65c8e14479486decc4")


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
   autoreconf -i &> /dev/null
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
   if [ "$CARCH" == "x86_64" ]; then
      rm -rf ${pkgdir}/usr/lib/libumlib*
   else
      rm -rf ${pkgdir}/usr/lib32/libumlib*
   fi
}
