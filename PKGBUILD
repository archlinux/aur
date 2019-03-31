# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-libosip2
pkgver=5.1.0
pkgrel=1
pkgdesc="oSIP is an implementation of SIP (32-bit)"
arch=('x86_64')
url="http://www.gnu.org/software/osip/"
license=('LGPL')
depends=('lib32-glibc' 'libosip2')
makedepends=('gcc-multilib')
options=(!emptydirs)
validpgpkeys=('34C3985D068879312FE23C8BB5902A3AD90A5421')
source=(https://ftp.gnu.org/gnu/osip/libosip2-${pkgver/_/-}.tar.gz)
sha256sums=('40573a997a656f967b2b5ebafbd36d7f1d4a4634abcf312643854057d061f145')

build() {
  cd "${srcdir}"/libosip2-${pkgver/_/-}/

  patch -p1 <<EOF
diff -wbBur libosip2-3.1.0/src/osip2/port_sema.c libosip2-3.1.0.my/src/osip2/port_sema.c
--- libosip2-3.1.0/src/osip2/port_sema.c	2007-06-05 14:17:50.000000000 +0400
+++ libosip2-3.1.0.my/src/osip2/port_sema.c	2008-10-22 17:47:37.000000000 +0400
@@ -22,6 +22,14 @@
 #include <stdlib.h>
 #include <stdio.h>

+union semun
+{
+     int val;
+     struct semid_ds *buf;
+     unsigned short int *array;
+     struct seminfo *__buf;
+};
+
 #include <osip2/internal.h>

 #include <osip2/internal.h>
EOF

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  ./configure --prefix=/usr --libdir=/usr/lib32 --disable-semaphore --enable-sysv
  make
}

package() {
  cd "${srcdir}"/libosip2-${pkgver/_/-}/
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
