# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=umview-mod-umlwip
pkgver=0.8.2
pkgrel=2
pkgdesc="View-OS in user space - LWIPv6 gateway module"
arch=('x86_64' 'i686')
url="https://www.sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc>=2.4'
         'libumlib0=0.8.2'
         'liblwipv6-dev')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
source=("http://http.debian.net/debian/pool/main/u/umview/umview_0.8.2.orig.tar.gz"
        "${pkgname}.diff"
        "http://ftp.us.debian.org/debian/pool/main/u/umview/umview-mod-umlwip_0.8.2-1.1_amd64.deb")
md5sums=("ac6d6baeb5700943ecf5021d980ceb7d"
         "7c2c9cfea16033c5fc8b0207fbc6e327"
         "b5fbf254aadcffeff79100d9d6129f4b")

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
   mkdir -p ${pkgdir}/usr/share/
   cp -r usr/share/doc ${pkgdir}/usr/share
   cd "$srcdir/umview-${pkgver}"
   make install > /dev/null 2>&1
   if [ "$CARCH" == "x86_64" ]; then
      rm -rf ${pkgdir}/usr/lib/libumlib*
   else
      rm -rf ${pkgdir}/usr/lib32/libumlib*
   fi
}
