# Maintainer: Antonio Cardace <anto.cardace@gmail.com>
pkgname=liblwipv6-svn
pkgver=r1129
pkgrel=1
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
source=("svn+http://svn.code.sf.net/p/view-os/code/trunk/lwipv6"
        "${pkgname}.install")
md5sums=("SKIP"
         "b6652a20b64c473886c3372d620ca788")

pkgver() {
   cd "$srcdir/lwipv6"
   local ver="$(svnversion)"
   printf "r%s" "${ver//[[:alpha:]]}"
}

build(){
   cd "$srcdir/lwipv6"
   autoreconf -i
   if [ "$CARCH" == "x86_64" ]; then
      ./configure --prefix="/usr" --disable-static
   else
      ./configure --prefix="/usr" --libdir="/usr/lib32" --disable-static
   fi
   make
}

package() {
   cd "$srcdir/lwipv6"
   make DESTDIR="$pkgdir" install
}
