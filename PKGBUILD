# $Id: PKGBUILD 78834 2012-10-25 13:03:04Z heftig $
# Upstream Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

_pkgbasename=glibc
pkgname=libx32-$_pkgbasename
pkgver=2.16.0
pkgrel=5.1
pkgdesc="GNU C Library for x32 ABI"
arch=('x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
makedepends=('gcc-multilib-x32>=4.7')
conflicts=('glibc-x32-seed')
options=('!strip' '!emptydirs')
source=(http://ftp.gnu.org/gnu/libc/${_pkgbasename}-${pkgver}.tar.xz{,.sig}
        glibc-2.15-fix-res_query-assert.patch
        glibc-2.16-unlock-mutex.patch
        glibc-2.16-rpcgen-cpp-path.patch
        glibc-2.16-strncasecmp-segfault.patch
        glibc-2.16-strtod-overflow.patch
        glibc-2.16-detect-fma.patch
        glibc-2.16-glob-use-size_t.patch
        libx32-glibc.conf)
md5sums=('80b181b02ab249524ec92822c0174cf7'
         '2a1221a15575820751c325ef4d2fbb90'
         '31f415b41197d85d3bbee3d1eecd06a3'
         '0afcd8c6020d61684aba63ed5f26bd91'
         'ea6a43915474e8276e9361eed6a01280'
         'f042d37cc8ca3459023431809039bc88'
         '61d322f7681a85d3293ada5c3ccc2c7e'
         '2426f593bc43f5499c41d21b57ee0e30'
         'a441353901992feda4b15a11a20140a1'
         '34a4169d2bdc5a3eb83676a0831aae57')

build() {
  cd ${srcdir}/${_pkgbasename}-${pkgver}

  # fix res_query assertion
  # http://sourceware.org/bugzilla/show_bug.cgi?id=13013
  patch -p1 -i ${srcdir}/glibc-2.15-fix-res_query-assert.patch

  # prevent hang by locked mutex
  # http://sourceware.org/git/?p=glibc.git;a=patch;h=c30e8edf
  patch -p1 -i ${srcdir}/glibc-2.16-unlock-mutex.patch

  # prevent need for /lib/cpp symlink
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=bf9b740a
  patch -p1 -i ${srcdir}/glibc-2.16-rpcgen-cpp-path.patch

  # strncasecmp segfault on i686
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=6db8f737
  patch -p1 -i ${srcdir}/glibc-2.16-strncasecmp-segfault.patch

  # strtod integer/buffer overflow
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=da1f4319
  patch -p1 -i ${srcdir}/glibc-2.16-strtod-overflow.patch

  # detect FMA supprt
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=a5cfcf08
  patch -p1 -i ${srcdir}/glibc-2.16-detect-fma.patch
  
  # prevent overflow in globc
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=6c62f108
  patch -p1 -i ${srcdir}/glibc-2.16-glob-use-size_t.patch

  # ldconfig does not need to look in /usr/lib64 or /usr/libx32 on Arch Linux
  sed -i "s#add_system_dir#do_not_add_system_dir#" sysdeps/unix/sysv/linux/x86_64/dl-cache.h

  cd ${srcdir}
  mkdir glibc-build
  cd glibc-build

  #if [[ ${CARCH} = "i686" ]]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    # TODO: make separate glibc-xen package for i686
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  #fi

  if [ -x "/opt/gcc-x32-seed/bin/gcc" ]; then
    echo "Using gcc-x32-seed"
    export CC="/opt/gcc-x32-seed/bin/gcc -mx32 -B/opt/gcc-x32-seed/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/"
    export CXX="/opt/gcc-x32-seed/bin/cpp -mx32 -B/opt/gcc-x32-seed/lib/gcc/x86_64-unknown-linux-gnu/4.7.1/"
  else
    echo "Using gcc-multilib-x32"
    export CC="gcc -mx32"
    export CXX="g++ -mx32"
  fi
  echo "slibdir=/usr/libx32" >> configparms

  # remove hardening options from CFLAGS for building libraries
  CFLAGS=${CFLAGS/-fstack-protector/}
  CFLAGS=${CFLAGS/-D_FORTIFY_SOURCE=2/}

  ${srcdir}/${_pkgbasename}-${pkgver}/configure --prefix=/usr \
      --libdir=/usr/libx32 --libexecdir=/usr/libx32 \
      --with-headers=/usr/include \
      --enable-add-ons=nptl,libidn \
      --enable-obsolete-rpc \
      --enable-kernel=2.6.32 \
      --enable-bind-now --disable-profile \
      --enable-stackguard-randomization \
      --target=x86_64-x32-linux --build=x86_64-linux --host=x86_64-x32-linux \
      --enable-multi-arch x86_64-x32-linux

  # build libraries with hardening disabled
  echo "build-programs=no" >> configparms
  make
  
  # re-enable hardening for programs
  sed -i "/build-programs=/s#no#yes#" configparms
  echo "CC += -fstack-protector -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -fstack-protector -D_FORTIFY_SOURCE=2" >> configparms
  make

  # remove harding in preparation to run test-suite
  sed -i '2,4d' configparms
}

check() {
  cd ${srcdir}/glibc-build
  make check
}

package() {
  cd ${srcdir}/glibc-build
  make install_root=${pkgdir} install

  rm -rf ${pkgdir}/{etc,sbin,usr/{bin,sbin,share},var}

  # We need one 32 bit specific header file
  find ${pkgdir}/usr/include -type f -not -name stubs-x32.h -delete

  # Do not strip the following files for improved debugging support
  # ("improved" as in not breaking gdb and valgrind...):
  #   ld-${pkgver}.so
  #   libc-${pkgver}.so
  #   libpthread-${pkgver}.so
  #   libthread_db-1.0.so

  cd $pkgdir
  strip $STRIP_BINARIES usr/libx32/getconf/* || true

  strip $STRIP_STATIC usr/libx32/*.a

  strip $STRIP_SHARED usr/libx32/{libanl,libBrokenLocale,libcidn,libcrypt}-*.so \
                      usr/libx32/libnss_{compat,db,dns,files,hesiod,nis,nisplus}-*.so \
                      usr/libx32/{libdl,libm,libnsl,libresolv,librt,libutil}-*.so \
                      usr/libx32/{libmemusage,libpcprofile,libSegFault}.so \
                      usr/libx32/{pt_chown,{audit,gconv}/*.so}

  # Dynamic linker
  mkdir ${pkgdir}/usr/lib
  ln -s ../libx32/ld-linux-x32.so.2 ${pkgdir}/usr/lib/

  # Add libx32 paths to the default library search path
  install -Dm644 "$srcdir/libx32-glibc.conf" "$pkgdir/etc/ld.so.conf.d/libx32-glibc.conf"

  # Symlink /usr/libx32/locale to /usr/lib/locale
  ln -s ../lib/locale "$pkgdir/usr/libx32/locale"

  # Fix issue that core/glibc didn't fix the path to /lib/ld-linux-x32.so.2
  ln -s /usr/lib ${pkgdir}/libx32
}
