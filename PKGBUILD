# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=liblwipv6
pkgver=1.5a
pkgrel=2
pkgdesc="User level (lightweight) TCP/IP stack with IPv6 support"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/view-os"
license=('GPL2')
depends=('glibc' 'libpcap>=0.8' 'vde2')
makedepends=('autoconf' 'automake' 'make' 'libtool')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
replaces=("$pkgname")
install="${pkgname}.install"
source=("http://http.debian.net/debian/pool/main/l/lwipv6/lwipv6_1.5a.orig.tar.gz"
        "${pkgname}.install"
        "http://ftp.us.debian.org/debian/pool/main/l/lwipv6/liblwipv6-2_1.5a-2_amd64.deb")
md5sums=("82258b72a5e0abbfd17920a8d7fa1906"
         "b4165e6142a92d65c8e14479486decc4"
         "256c6a739c765988eafdd347f174635d")

build(){
   cd "$srcdir/lwipv6-${pkgver}"
   autoreconf -i
   if [ "$CARCH" == "x86_64" ]; then
      ./configure --prefix="${pkgdir}/usr" --disable-static
   else
      ./configure --prefix="${pkgdir}/usr" --libdir="${pkgdir}/usr/lib32" --disable-static
   fi
   make
}

package() {
   mkdir -p ${pkgdir}/usr/share
   tar -xf data.tar.gz
   cp -r usr/share ${pkgdir}/usr/
   cd "$srcdir/lwipv6-${pkgver}"
   make install &> /dev/null
   rm -rf ${pkgdir}/usr/include
}
