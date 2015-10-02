# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=umview
pkgver=0.8.2
pkgrel=2
pkgdesc="User-mode implementation of View-OS."
arch=('x86_64' 'i686')
url="https://www.sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.15'
         'libumlib0=0.8.2')
optdepends=('umview-mod-umlwip: module for umview networking')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="$pkgname.install"
source=("http://http.debian.net/debian/pool/main/u/umview/umview_0.8.2.orig.tar.gz"
        "${pkgname}.diff"
        "http://ftp.us.debian.org/debian/pool/main/u/umview/umview_0.8.2-1.1_i386.deb"
        "${pkgname}.install")
md5sums=("ac6d6baeb5700943ecf5021d980ceb7d"
         "da9e8792d0c16a1a5cf2eb86d326715e"
         "d00669b5d2b9137dad7aa66e5d5a274a"
         "b4165e6142a92d65c8e14479486decc4")

prepare() {
   cd "$srcdir/umview-${pkgver}"
   patch -i ../${pkgname}.diff Makefile.am
}

build(){
   cd "$srcdir/umview-${pkgver}"
   autoreconf -i &> /dev/null
   if [ "$CARCH" == "x86_64" ]; then
      ./configure --prefix="${pkgdir}/usr" --disable-static
   else
      ./configure --prefix="${pkgdir}/usr" --libdir="${pkgdir}/usr/lib32" --disable-static
   fi
   make
}

package() {
   tar -xf data.tar.xz
   mkdir -p ${pkgdir}/usr/share/man
   cp -r usr/share/doc ${pkgdir}/usr/share
   cp -r usr/share/man/man2 ${pkgdir}/usr/share/man
   cp -r usr/share/man/man5 ${pkgdir}/usr/share/man
   cd "$srcdir/umview-${pkgver}"
   make install > /dev/null 2>&1
   if [ "$CARCH" == "x86_64" ]; then
      rm -rf ${pkgdir}/usr/lib/libumlib*
   else
      rm -rf ${pkgdir}/usr/lib32/libumlib*
   fi
}
