# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=umview-mod-umlwip-svn
pkgver=r1129
pkgrel=2
pkgdesc="View-OS in user space - LWIPv6 gateway module"
arch=('x86_64' 'i686')
url="https://www.sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.4'
         'libumlib0-svn'
         'liblwipv6-svn')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("svn+http://svn.code.sf.net/p/view-os/code/trunk/xmview-os"
         "${pkgname}.diff"
         "${pkgname}.install")
md5sums=("SKIP"
         "15fd402dc118bf82c65e4c31d808f530"
         "981ba81585fa1fbadb632c3a05e803a9")

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
      ./configure --prefix="/usr" --disable-static
   else
      ./configure --prefix="/usr" --libdir="/usr/lib32" --disable-static
   fi
   make
}

package() {
   cd "$srcdir/xmview-os"
   make DESTDIR="$pkgdir"  install
   if [ "$CARCH" == "x86_64" ]; then
      rm -rf ${pkgdir}/usr/lib/libumlib*
   else
      rm -rf ${pkgdir}/usr/lib32/libumlib*
   fi
}
