# Maintainer: Jens Schwander <thomas747a@gmail.com>

pkgname=ltfs-hpe
pkgver=3.5.0
pkgrel=1
pkgdesc="HPE StoreOpen and Linear Tape File System (LTFS) Software for hp drives uses LTFS Specification 2.40"

arch=('x86_64' 'aarch64')
url="https://www.hpe.com/storage/storeopen"
license=('LGPL2.1')
depends=('fuse2>=2.8.5' 'libxml2>=2.7.6' 'icu>=50.1.2' 'e2fsprogs>=1.41')
makedepends=('autoconf' 'automake' 'libtool' 'pkg-config')
conflicts=('ltfs-quantum')
provides=('ltfs')
replaces=('ltfs')
source=("https://downloads.hpe.com/pub/softlib2/software1/pubsw-generic/p854080462/v238180/HPE_StoreOpen_Software_${pkgver}_Source_macOS_RHEL.tar.gz"
        "ltfs-warnings.patch")
sha256sums=('c4aa518f4f8966930d92619f25a84f4825218d74368a89d225ce90d13ae1df1f'
            '1f4e079d9ee8b590c2894abf3992635045c2e7881d9f8b3edd3d7a37103b0465')

prepare() {
  cd "$srcdir"
  tar -xzvf HPE_StoreOpen_Software_${pkgver}_Source_macOS_RHEL.tar.gz
  cd ltfs
  
  patch -p1 -i "$srcdir/ltfs-warnings.patch"
  
  sed -i 's|/usr/local|/usr|g; s|/lib64|/lib|g' configure.ac
  sed -i '/AC_PROG_LIBTOOL/i AM_PROG_AR' configure.ac
  sed -i 's/AC_PROG_CC_C99/AC_PROG_CC/; s/AC_PROG_LIBTOOL/LT_INIT/' configure.ac
  sed -i '/AM_INIT_AUTOMAKE/c\AM_INIT_AUTOMAKE([foreign subdir-objects])' configure.ac
  
  find . -name "*.c" -o -name "*.h" | xargs sed -i '1i#ifndef TRUE\n#define TRUE 1\n#endif\n#ifndef FALSE\n#define FALSE 0\n#endif'
  sed -i '/sys\/sysctl\.h/d' src/libltfs/arch/arch_info.c
  find . -name Makefile.am | xargs sed -i '1iAMFLAGS = -Wno-portability'
  sed -i '/^install-data-local:/,/^$/d' src/libltfs/Makefile.am conf/Makefile.am init.d/Makefile.am
  
  autoreconf -fiv
}

build() {
  cd "$srcdir/ltfs"
  
  # Remove any existing optimization flags
  CFLAGS=$(echo ${CFLAGS} | sed -e 's/-O[0-9]//g')
  CXXFLAGS=$(echo ${CXXFLAGS} | sed -e 's/-O[0-9]//g')
  
  # Set optimization level and add security flags
  CFLAGS+=" -O2 -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fPIC"
  CXXFLAGS+=" -O2 -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fPIC"
  LDFLAGS+=" -Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now"
  
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libdir=/usr/lib \
              --with-default-driver=ltotape \
  
  make  CFLAGS="$CFLAGS" CXXFLAGS="$CXXFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
  cd "$srcdir/ltfs"

  make DESTDIR="$pkgdir/" install
  
  install -dm755 "$pkgdir/usr/share/snmp"
  install -Dm644 src/libltfs/LtfsSnmpTrapDef.txt "$pkgdir/usr/share/snmp/LtfsSnmpTrapDef.txt"
  install -Dm644 src/libltfs/LTFS-MIB.txt "$pkgdir/usr/share/snmp/LTFS-MIB.txt"
  install -Dm644 conf/ltfs.conf.linux "$pkgdir/etc/ltfs.conf"
  install -Dm644 conf/ltfs.conf.local "$pkgdir/etc/ltfs.conf.local"
  install -Dm755 init.d/ltfs "$pkgdir/usr/share/ltfs/ltfs"
  install -Dm644 doc/README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 doc/COPYING.LIB "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find "$pkgdir" -name '*.la' -delete
  install -dm755 "$pkgdir/usr/lib/ltfs"
  
  for lib in libdriver libiosched libkmi; do
    find "$pkgdir/usr/lib" -name "${lib}-*.so*" -exec mv {} "$pkgdir/usr/lib/ltfs/" \;
  done
  
  find "$pkgdir" -type f -exec sed -i 's|__CONFDIR__|/etc|g; s|__DEFAULT_DRIVER__|ltotape|g; s|__DEFAULT_IOSCHED__|unified|g; s|__DEFAULT_KMI__|none|g; s|__LIBDIR__|/usr/lib|g; s|\*\*LIBDIR\*\*|/usr/lib|g' {} +
  sed -i 's|/usr/lib/lib|/usr/lib/ltfs/lib|g' "$pkgdir/etc/ltfs.conf"
}