# $Id: PKGBUILD 78830 2012-10-25 12:44:33Z heftig $
# Upstream Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Maintainer: Fantix King <fantix.king at gmail.com>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgbase='gcc-multilib-x32'
pkgname='gcc-multilib-x32'
true && pkgname=('gcc-multilib-x32' 'gcc-libs-multilib-x32' 'libx32-gcc-libs' 'gcc-fortran-multilib-x32' 'gcc-objc-multilib-x32' 'gcc-go-multilib-x32')
pkgver=4.7.2
pkgrel=2.1
_origrel=2
#_snapshot=4.7-20120721
pkgdesc="The GNU Compiler Collection for multilib with x32 ABI support"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils-multilib>=2.22' 'libmpc' 'cloog' 'ppl' 'doxygen'
             'lib32-glibc>=2.16' 'libx32-glibc>=2.16')
checkdepends=('dejagnu')
options=('!libtool' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
	#ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
	gcc_pure64-multilib.patch
        gcc-4.7.1-libada-pic.patch
        gcc-4.7.1-libgo-write.patch
        189626.patch)
md5sums=('cc308a0891e778cfda7a151ab8a6e762'
         '55818c34a79ec90913ef7778e17ea6b6'
         '2acbc9d35cc9d72329dc71d6b1f162ef'
         'df82dd175ac566c8a6d46b11ac21f14c'
         'e01126c78cefe99498ff1e04fa728a2b')

if [ -n "${_snapshot}" ]; then
  _basedir="${srcdir}/gcc-${_snapshot}"
else
  _basedir="${srcdir}/gcc-${pkgver}"
fi

build() {
  cd ${_basedir}

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  patch -p1 -i ${srcdir}/gcc_pure64-multilib.patch

  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53679
  patch -p1 -i ${srcdir}/gcc-4.7.1-libgo-write.patch
  
  # bug to file...
  patch -p1 -i ${srcdir}/gcc-4.7.1-libada-pic.patch

  # http://gcc.1065356.n5.nabble.com/Bug-java-53982-New-gij-built-for-x32-can-t-run-a-simple-Hello-World-class-td452375.html
  # not yet ready for GCC 4.8
  #patch -p1 -i ${srcdir}/189626.patch

  echo ${pkgver} > gcc/BASE-VER

  cd ${srcdir}
  mkdir gcc-build && cd gcc-build

  ${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --enable-libstdcxx-time \
      --enable-gnu-unique-object --enable-linker-build-id \
      --with-ppl --enable-cloog-backend=isl \
      --disable-ppl-version-check --disable-cloog-version-check \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --with-linker-hash-style=gnu \
      --enable-multilib --with-multilib-list=m32,m64,mx32 \
      --disable-libssp \
      --disable-build-with-cxx --disable-build-poststage1-with-cxx \
      --enable-checking=release
  make
  
  # make documentation
  cd $CHOST/libstdc++-v3
  make doc-man-doxygen
}

check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${_basedir}/contrib/test_summary
}

package_gcc-libs-multilib-x32()
{
  pkgdesc="Runtime libraries shipped by GCC for multilib with x32 ABI support"
  depends=('glibc>=2.16' "lib32-gcc-libs=$pkgver-$_origrel" "libx32-gcc-libs=$pkgver-$pkgrel")
  provides=("gcc-libs=$pkgver-$_origrel" "gcc-libs-multilib=$pkgver-$_origrel")
  conflicts=('gcc-libs')
  install=gcc-libs.install

  cd ${srcdir}/gcc-build
  make -j1 -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
  for lib in libmudflap libgomp libstdc++-v3/src libitm; do
    make -j1 -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done
  make -j1 -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install
  make -j1 -C $CHOST/libgomp DESTDIR=${pkgdir} install-info
  make -j1 -C $CHOST/libitm DESTDIR=${pkgdir} install-info

  make -j1 DESTDIR=${pkgdir} install-target-libquadmath  
  make -j1 DESTDIR=${pkgdir} install-target-libgfortran
  make -j1 DESTDIR=${pkgdir} install-target-libobjc

  # remove unnecessary files installed by install-target-{libquadmath,libgfortran,libobjc}
  rm -r ${pkgdir}/usr/lib/{gcc/,libgfortran.spec}

  # remove stuff in lib32-gcc-libs
  rm -r ${pkgdir}/usr/lib32
  rm -r ${pkgdir}/usr/libx32

  # remove static libraries
  find ${pkgdir} -name *.a -delete
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_libx32-gcc-libs()
{
  pkgdesc="Runtime libraries shipped by GCC (x32 ABI)"
  depends=('libx32-glibc>=2.16' "gcc-libs>=$pkgver")

  cd ${srcdir}/gcc-build
  make -j1 -C $CHOST/x32/libgcc DESTDIR=${pkgdir} install-shared
  for lib in libmudflap libgomp libstdc++-v3/src libitm; do
    make -j1 -C $CHOST/x32/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  make -j1 DESTDIR=${pkgdir} install-target-libquadmath
  make -j1 DESTDIR=${pkgdir} install-target-libgfortran
  make -j1 DESTDIR=${pkgdir} install-target-libobjc

  # remove unnecessary files installed by install-target-{libquadmath,libgfortran,libobjc}
  rm ${pkgdir}/usr/libx32/libgfortran.spec

  # remove stuff in gcc-libs-multilib
  rm -r ${pkgdir}/usr/lib
  rm -r ${pkgdir}/usr/lib32
  rm -r ${pkgdir}/usr/share/info

  # remove static libraries
  find ${pkgdir} -name *.a -delete
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/libx32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}
package_gcc-multilib-x32()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends for multilib with x32 ABI support"
  depends=("gcc-libs-multilib-x32=$pkgver-$pkgrel" 'binutils-multilib>=2.23' 'libmpc' 'cloog' 'ppl')
  groups=('multilib-devel')
  provides=("gcc=$pkgver-$_origrel" "gcc-multilib=$pkgver-$_origrel" "gcc-x32-seed=$pkgver-$_origrel")
  conflicts=('gcc' 'gcc-x32-seed')
  install=gcc.install

  cd ${srcdir}/gcc-build
  
  make -j1 DESTDIR=${pkgdir} install

  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
  mv $pkgdir{,/usr/share/gdb/auto-load}/usr/lib/libstdc++.so.6.0.17-gdb.py

  # unfortunately it is much, much easier to install the lot and clean-up the mess...
  rm $pkgdir/usr/bin/{{$CHOST-,}gfortran,{$CHOST-,}gccgo,gnat*} || true
  rm $pkgdir/usr/lib{,32,x32}/*.so*
  rm $pkgdir/usr/lib{,32,x32}/lib{ffi,gfortran,go{,begin},objc,quadmath}.a
  rm $pkgdir/usr/lib{,32,x32}/libgfortran.spec
  rm -r $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{{,32/,x32/}ada{include,lib},finclude,include/objc} || true
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/include/{ffi{,target}.h,quadmath{,_weak}.h}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{cc1obj{,plus},f951,gnat1,go1} || true
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{,32/,x32/}{libcaf_single,libgfortranbegin}.a
  rm -r $pkgdir/usr/lib{,32,x32}/go
  rm $pkgdir/usr/share/info/{gccgo,gfortran,gnat*,libgomp,libquadmath,libitm}.info || true
  rm $pkgdir/usr/share/locale/{de,fr}/LC_MESSAGES/libstdc++.mo
  rm $pkgdir/usr/share/man/man1/{gccgo,gfortran}.1
  rm $pkgdir/usr/share/man/man3/ffi*

  # many packages expect this symlinks
  ln -s gcc ${pkgdir}/usr/bin/cc

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/bin/c89 <<"EOF"
#!/bin/sh
fl="-std=c89"
for opt; do
  case "$opt" in
    -ansi|-std=c89|-std=iso9899:1990) fl="";;
    -std=*) echo "`basename $0` called with non ANSI/ISO C option $opt" >&2
	    exit 1;;
  esac
done
exec gcc $fl ${1+"$@"}
EOF

  cat > $pkgdir/usr/bin/c99 <<"EOF"
#!/bin/sh
fl="-std=c99"
for opt; do
  case "$opt" in
    -std=c99|-std=iso9899:1999) fl="";;
    -std=*) echo "`basename $0` called with non ISO C99 option $opt" >&2
	    exit 1;;
  esac
done
exec gcc $fl ${1+"$@"}
EOF

  chmod 755 $pkgdir/usr/bin/c{8,9}9

  # install the libstdc++ man pages
  install -dm755 ${pkgdir}/usr/share/man/man3
  install -m644 -t ${pkgdir}/usr/share/man/man3 \
    ${CHOST}/libstdc++-v3/doc/doxygen/man/man3/*.3

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-fortran-multilib-x32()
{
  pkgdesc="Fortran front-end for GCC for multilib with x32 ABI support"
  depends=("gcc-multilib-x32=$pkgver-$pkgrel")
  provides=("gcc-fortran=$pkgver-$_origrel")
  conflicts=('gcc-fortran')
  install=gcc-fortran.install

  cd ${srcdir}/gcc-build
  make -j1 DESTDIR=${pkgdir} install-target-libquadmath
  make -j1 DESTDIR=$pkgdir install-target-libgfortran
  make -j1 -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -j1 -C gcc DESTDIR=$pkgdir fortran.install-{common,man,info}
  install -Dm755 gcc/f951 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/f951
  
  # remove libraries included in gcc-libs
  rm ${pkgdir}/usr/lib{,32,x32}/lib{gfortran,quadmath}.so*
  rm ${pkgdir}/usr/share/info/libquadmath.info

  ln -s gfortran ${pkgdir}/usr/bin/f95

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-fortran-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-objc-multilib-x32()
{
  pkgdesc="Objective-C front-end for GCC for multilib with x32 ABI support"
  depends=("gcc-multilib-x32=$pkgver-$pkgrel")
  provides=("gcc-objc=$pkgver-$_origrel")
  conflicts=('gcc-objc')

  cd ${srcdir}/gcc-build
  make -j1 DESTDIR=$pkgdir install-target-libobjc
  install -dm755 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/
  install -m755 gcc/cc1obj{,plus} $pkgdir/usr/lib/gcc/$CHOST/$pkgver/

  # remove libraries included in gcc-libs
  rm ${pkgdir}/usr/lib{,32,x32}/libobjc.so*

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-objc-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-ada-multilib-x32()
{
  pkgdesc="Ada front-end for GCC (GNAT) for multilib with x32 ABI support"
  depends=("gcc-multilib-x32=$pkgver-$pkgrel")
  provides=("gcc-ada=$pkgver-$_origrel")
  conflicts=('gcc-ada')
  install=gcc-ada.install

  cd ${srcdir}/gcc-build/gcc
  make -j1 DESTDIR=$pkgdir ada.install-{common,info}
  install -m755 gnat1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver

  cd ../$CHOST/32/libada
  make -j1 DESTDIR=${pkgdir} INSTALL="install" \
    INSTALL_DATA="install -m644" install-gnatlib

  cd ../$CHOST/x32/libada
  make -j1 DESTDIR=${pkgdir} INSTALL="install" \
    INSTALL_DATA="install -m644" install-gnatlib

  ln -s gcc ${pkgdir}/usr/bin/gnatgcc
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-ada-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-go-multilib-x32()
{
  pkgdesc="Go front-end for GCC for multilib with x32 ABI support"
  depends=("gcc-multilib-x32=$pkgver-$pkgrel")
  provides=("gcc-go=$pkgver-$_origrel")
  conflicts=('gcc-go')
  install=gcc-go.install

  cd ${srcdir}/gcc-build
  make -j1 DESTDIR=$pkgdir install-target-libgo
  make -j1 -C gcc DESTDIR=$pkgdir go.install-{common,man,info}
  install -Dm755 gcc/go1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/go1

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-go/RUNTIME.LIBRARY.EXCEPTION
}
pkgdesc="The GNU Compiler Collection for multilib with x32 ABI support"
