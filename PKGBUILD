# $Id: PKGBUILD 73407 2012-07-07 09:50:53Z heftig $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgbase='gcc-multilib'
pkgname=('gcc-multilib' 'gcc-libs-multilib' 'lib32-gcc-libs' 'gcc-fortran-multilib' 'gcc-objc-multilib' 'gcc-ada-multilib' 'gcc-go-multilib')
pkgver=4.7.1
pkgrel=4.1
#_snapshot=4.7-20120505
_libstdcppmanver=20120605		# Note: check source directory name when updating this
pkgdesc="The GNU Compiler Collection for multilib"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils-multilib>=2.22' 'libmpc' 'cloog' 'ppl' 'gcc-ada-multilib'
             'lib32-glibc>=2.16')
checkdepends=('dejagnu')
options=('!libtool' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
	#ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-api.${_libstdcppmanver}.man.tar.bz2
	gcc_pure64-multilib.patch
	gcc-4.7.1-libada-pic.patch
	gcc-4.7.1-libgo-write.patch
        gcc-4.7.1-libgo-mksysinfo.patch)
md5sums=('933e6f15f51c031060af64a9e14149ff'
         '767c62f9a047c4434f2345decf1d0819'
         'ec24c32d3d1030c2bc8cb2ad2d1dc629'
         '2acbc9d35cc9d72329dc71d6b1f162ef'
         'df82dd175ac566c8a6d46b11ac21f14c'
         '8e847244dba042d0aa3297713edaf70c')


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

  # http://gcc.gnu.org/ml/gcc-patches/2012-06/msg01946.html
  patch -p0 -i ${srcdir}/gcc-4.7.1-libgo-mksysinfo.patch

  echo ${pkgver} > gcc/BASE-VER

  cd ${srcdir}
  mkdir gcc-build && cd gcc-build

  ${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
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
      --enable-multilib --disable-libssp \
      --disable-build-with-cxx --disable-build-poststage1-with-cxx \
      --enable-checking=release
  make
}

check() {
  cd gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${_basedir}/contrib/test_summary
}

package_gcc-libs-multilib()
{
  pkgdesc="Runtime libraries shipped by GCC for multilib"
  depends=('glibc>=2.16' "lib32-gcc-libs=$pkgver-$pkgrel")
  provides=("gcc-libs=$pkgver-$pkgrel")
  conflicts=('gcc-libs')
  install=gcc-libs.install

  cd gcc-build
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

  # remove static libraries
  find ${pkgdir} -name *.a -delete
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_lib32-gcc-libs()
{
  pkgdesc="Runtime libraries shipped by GCC (32-bit)"
  depends=('lib32-glibc>=2.16' "gcc-libs>=$pkgver")

  cd gcc-build
  make -j1 -C $CHOST/32/libgcc DESTDIR=${pkgdir} install-shared
  for lib in libmudflap libgomp libstdc++-v3/src libitm; do
    make -j1 -C $CHOST/32/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  make -j1 DESTDIR=${pkgdir} install-target-libquadmath
  make -j1 DESTDIR=${pkgdir} install-target-libgfortran
  make -j1 DESTDIR=${pkgdir} install-target-libobjc

  # remove unnecessary files installed by install-target-{libquadmath,libgfortran,libobjc}
  rm ${pkgdir}/usr/lib32/libgfortran.spec

  # remove stuff in gcc-libs-multilib
  rm -r ${pkgdir}/usr/lib
  rm -r ${pkgdir}/usr/share/info

  # remove static libraries
  find ${pkgdir} -name *.a -delete
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/lib32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-multilib()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends for multilib"
  depends=("gcc-libs-multilib=$pkgver-$pkgrel" 'binutils-multilib>=2.22' 'libmpc' 'cloog' 'ppl')
  groups=('multilib-devel')
  provides=("gcc=$pkgver-$pkgrel")
  conflicts=('gcc')
  install=gcc.install

  cd gcc-build
  
  make -j1 DESTDIR=${pkgdir} install

  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
  mv $pkgdir{,/usr/share/gdb/auto-load}/usr/lib/libstdc++.so.6.0.17-gdb.py

  # unfortunately it is much, much easier to install the lot and clean-up the mess...
  rm $pkgdir/usr/bin/{{$CHOST-,}gfortran,{$CHOST-,}gccgo,gnat*}
  rm $pkgdir/usr/lib{,32}/*.so*
  rm $pkgdir/usr/lib{,32}/lib{ffi,gfortran,go{,begin},objc,quadmath}.a
  rm $pkgdir/usr/lib{,32}/libgfortran.spec
  rm -r $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{{,32/}ada{include,lib},finclude,include/objc}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/include/{ffi{,target}.h,quadmath{,_weak}.h}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{cc1obj{,plus},f951,gnat1,go1}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{,32/}{libcaf_single,libgfortranbegin}.a
  rm -r $pkgdir/usr/lib{,32}/go
  rm $pkgdir/usr/share/info/{gccgo,gfortran,gnat*,libgomp,libquadmath,libitm}.info
  rm $pkgdir/usr/share/locale/{de,fr}/LC_MESSAGES/libstdc++.mo
  rm $pkgdir/usr/share/man/man1/{gccgo,gfortran}.1
  rm $pkgdir/usr/share/man/man3/ffi*

  # many packages require these symlinks
  #install -dm755 ${pkgdir}/lib
  #ln -s /usr/bin/cpp ${pkgdir}/lib/cpp
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
  install -m644 ${srcdir}/libstdc++-api.${_libstdcppmanver}.man/man3/* \
    ${pkgdir}/usr/share/man/man3/

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-fortran-multilib()
{
  pkgdesc="Fortran front-end for GCC for multilib"
  depends=("gcc-multilib=$pkgver-$pkgrel")
  provides=("gcc-fortran=$pkgver-$pkgrel")
  conflicts=('gcc-fortran')
  install=gcc-fortran.install

  cd gcc-build
  make -j1 DESTDIR=${pkgdir} install-target-libquadmath
  make -j1 DESTDIR=$pkgdir install-target-libgfortran
  make -j1 -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -j1 -C gcc DESTDIR=$pkgdir fortran.install-{common,man,info}
  install -Dm755 gcc/f951 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/f951
  
  # remove libraries included in gcc-libs
  rm ${pkgdir}/usr/lib{,32}/lib{gfortran,quadmath}.so*
  rm ${pkgdir}/usr/share/info/libquadmath.info

  ln -s gfortran ${pkgdir}/usr/bin/f95

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-fortran-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-objc-multilib()
{
  pkgdesc="Objective-C front-end for GCC for multilib"
  depends=("gcc-multilib=$pkgver-$pkgrel")
  provides=("gcc-objc=$pkgver-$pkgrel")
  conflicts=('gcc-objc')

  cd gcc-build
  make -j1 DESTDIR=$pkgdir install-target-libobjc
  install -dm755 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/
  install -m755 gcc/cc1obj{,plus} $pkgdir/usr/lib/gcc/$CHOST/$pkgver/

  # remove libraries included in gcc-libs
  rm ${pkgdir}/usr/lib{,32}/libobjc.so*

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-objc-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-ada-multilib()
{
  pkgdesc="Ada front-end for GCC (GNAT) for multilib"
  depends=("gcc-multilib=$pkgver-$pkgrel")
  provides=("gcc-ada=$pkgver-$pkgrel")
  conflicts=('gcc-ada')
  install=gcc-ada.install

  cd gcc-build/gcc
  make -j1 DESTDIR=$pkgdir ada.install-{common,info}
  install -m755 gnat1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver

  cd ../$CHOST/32/libada
  make -j1 DESTDIR=${pkgdir} INSTALL="install" \
    INSTALL_DATA="install -m644" install-gnatlib

  ln -s gcc ${pkgdir}/usr/bin/gnatgcc
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-ada-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-go-multilib()
{
  pkgdesc="Go front-end for GCC for multilib"
  depends=("gcc-multilib=$pkgver-$pkgrel")
  provides=("gcc-go=$pkgver-$pkgrel")
  conflicts=('gcc-go')
  install=gcc-go.install

  cd gcc-build
  make -j1 DESTDIR=$pkgdir install-target-libgo
  make -j1 -C gcc DESTDIR=$pkgdir go.install-{common,man,info}
  install -Dm755 gcc/go1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/go1

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-go/RUNTIME.LIBRARY.EXCEPTION
}
