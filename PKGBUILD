# Maintainer: Yurii Kolesnykov (yurikooles) <yurikoles@gmail.com>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: wtx <sdrb@onet.eu>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=('gcc53-alternative-multilib' 'gcc53-alternative-libs-multilib' 'lib32-gcc53-alternative-libs')
pkgver=5.3.0
#_pkgver=5.3
_islver=0.17
_cloogver=0.18.1
pkgrel=1
pkgdesc="The GNU Compiler Collection 5.3 for multilib"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.25' 'libmpc' 'doxygen'
             'lib32-glibc>=2.23')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz)
md5sums=('c9616fd448f980259c31de613e575719'
         '47dcb4fc963a9a625ccb47b72a167ffa'
         'e34fca0540d840e5d0f6427e98c92252')

if [ -n "${_snapshot}" ]; then
  _basedir=gcc-${_snapshot}
else
  _basedir=gcc-${pkgver}
fi

_libdir="usr/gcc53/lib/gcc/$CHOST/$pkgver"


prepare() {
  cd ${srcdir}/${_basedir}

  # link isl/cloog for in-tree builds
  ln -sf ../isl-${_islver} isl
  ln -sf ../cloog-${_cloogver} cloog

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  patch -p1 -i ${startdir}/cfns.h.diff

  mkdir -p ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

 export LD_PRELOAD=/usr/lib/libstdc++.so.6

 ${srcdir}/${_basedir}/configure --prefix=/usr/gcc53 --exec-prefix=/usr/gcc53 \
      --libdir=/usr/gcc53/lib --libexecdir=/usr/gcc53/lib \
      --mandir=/usr/gcc53/share/man --infodir=/usr/gcc53/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,lto \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --enable-multilib --disable-werror \
      --enable-checking=release

  make

  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${srcdir}/${_basedir}/contrib/test_summary
}

package_lib32-gcc53-alternative-libs()
{
  pkgdesc="Runtime GCC 5.3 libraries (32-bit)"
  depends=('lib32-glibc>=2.23')
  options=('!emptydirs' '!strip')

  cd ${srcdir}/gcc-build

  make -C $CHOST/32/libgcc DESTDIR=${pkgdir} install-shared
  rm ${pkgdir}/${_libdir}/32/libgcc_eh.a

  for lib in libatomic \
             libcilkrts \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/32/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  #  make -C $CHOST/32/libobjc DESTDIR=${pkgdir} install-libs

  # remove stuff in gcc-libs-multilib
  rm -r ${pkgdir}/usr/gcc53/lib
}

package_gcc53-alternative-libs-multilib()
{
  pkgdesc="Runtime GCC 5.3 libraries for multilib"
  depends=('glibc>=2.23' "lib32-gcc53-alternative-libs=$pkgver-$pkgrel")
  provides=("gcc53-alternative-libs=$pkgver-$pkgrel")
#  conflicts=('gcc-libs')
  options=('!emptydirs' '!strip')
  install=gcc53-alternative-libs.install

  cd ${srcdir}/gcc-build
  
  make -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
  rm ${pkgdir}/${_libdir}/libgcc_eh.a
  
  for lib in libatomic \
             libcilkrts \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  [[ $CARCH == "x86_64" ]] && \
    make -C $CHOST/libsanitizer/tsan DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES

#  make -C $CHOST/libobjc DESTDIR=${pkgdir} install-libs
  make -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install




#  for lib in libgomp \
#             libitm \
#             libquadmath; do
#    make -C $CHOST/$lib DESTDIR=${pkgdir} install-info
#  done

#  rm ${pkgdir}/usr/gcc53/share/locale/de/LC_MESSAGES/libstdc++.mo
#  rm ${pkgdir}/usr/gcc53/share/locale/fr/LC_MESSAGES/libstdc++.mo

  # remove stuff in lib32-gcc-libs
  #rm -r ${pkgdir}/usr/lib32

  # Install Runtime Library Exception
  #  install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME     ${pkgdir}/usr/share/licenses/gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc53-alternative-multilib()
{
  pkgdesc="The GNU Compiler Collection 5.3 - C and C++ frontends for multilib"
  depends=("gcc53-alternative-libs-multilib=$pkgver-$pkgrel" 'binutils>=2.25' 'libmpc')
  groups=('multilib-devel')
  options=('staticlibs')
  provides=("gcc53=$pkgver-$pkgrel")
#  conflicts=('gcc')
  install=gcc53-alternative.install

  cd ${srcdir}/gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 gcc/gcov $pkgdir/usr/gcc53/bin/
  install -m755 -t $pkgdir/${_libdir}/ gcc/{cc1,cc1plus,collect2,lto1}

  make -C $CHOST/libgcc DESTDIR=${pkgdir} install
  make -C $CHOST/32/libgcc DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/gcc53/lib{,32}/libgcc_s.so*
  
  make -C $CHOST/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/python DESTDIR=${pkgdir} install
  make -C $CHOST/32/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C $CHOST/32/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C $CHOST/32/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install

  install -d $pkgdir/usr/gcc53/share/gdb/auto-load/usr/lib
  mv $pkgdir/usr/gcc53/lib/libstdc++.so.6.*-gdb.py  $pkgdir/usr/gcc53/share/gdb/auto-load/usr/lib/

  rm ${pkgdir}/usr/gcc53/lib{,32}/libstdc++.so*

  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders
  make -C lto-plugin DESTDIR=${pkgdir} install

  make -C $CHOST/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_cilkincludeHEADERS
  make -C $CHOST/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_libsubincludeHEADERS
  make -C $CHOST/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR=${pkgdir} install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libsanitizer DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS

  make -C libiberty DESTDIR=${pkgdir} install
  # install PIC version of libiberty
#  install -m644 ${srcdir}/gcc-build/libiberty/pic/libiberty.a ${pkgdir}/usr/lib
  install -m644 ${srcdir}/gcc-build/libiberty/pic/libiberty.a ${pkgdir}/usr/gcc53/lib


  make -C gcc DESTDIR=${pkgdir} install-man install-info
#  rm ${pkgdir}/usr/share/man/man1/{gccgo,gfortran}.1
#  rm ${pkgdir}/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn}.info

  make -C libcpp DESTDIR=${pkgdir} install
  make -C gcc DESTDIR=${pkgdir} install-po

  # many packages expect this symlink
  ln -s gcc ${pkgdir}/usr/gcc53/bin/cc

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/gcc53/bin/c89 <<"EOF"
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

  cat > $pkgdir/usr/gcc53/bin/c99 <<"EOF"
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

  chmod 755 $pkgdir/usr/gcc53/bin/c{8,9}9

  # install the libstdc++ man pages
  make -C $CHOST/libstdc++-v3/doc DESTDIR=$pkgdir doc-install-man



  mv ${pkgdir}/usr/gcc53/share/man/man1/gcc.1 ${pkgdir}/usr/gcc53/share/man/man1/gcc-5.3.1
  mv ${pkgdir}/usr/gcc53/share/man/man1/g++.1 ${pkgdir}/usr/gcc53/share/man/man1/g++-5.3.1
  mv ${pkgdir}/usr/gcc53/share/man/man1/cpp.1 ${pkgdir}/usr/gcc53/share/man/man1/cpp-5.3.1
  mv ${pkgdir}/usr/gcc53/share/man/man1/gcov.1 ${pkgdir}/usr/gcc53/share/man/man1/gcov-5.3.1
  mv ${pkgdir}/usr/gcc53/share/info/cpp.info ${pkgdir}/usr/gcc53/share/man/man1/cpp-5.3.info
  mv ${pkgdir}/usr/gcc53/share/info/gcc.info ${pkgdir}/usr/gcc53/share/man/man1/gcc-5.3.info
  mv ${pkgdir}/usr/gcc53/share/info/cppinternals.info ${pkgdir}/usr/gcc53/share/man/man1/cppinternals-5.3.info
  mv ${pkgdir}/usr/gcc53/share/info/gccinstall.info ${pkgdir}/usr/gcc53/share/man/man1/gccinstall-5.3.info
  mv ${pkgdir}/usr/gcc53/share/info/gccint.info ${pkgdir}/usr/gcc53/share/man/man1/gccint-5.3.info

  rm -r ${pkgdir}/usr/gcc53/share/locale/

  install -d ${pkgdir}/usr/bin

  cd ${pkgdir}/usr/bin/
  ln -s ../gcc53/bin/c++ c++-5.3
  ln -s ../gcc53/bin/c89 c89-5.3
  ln -s ../gcc53/bin/c99 c99-5.3
  ln -s ../gcc53/bin/cc  cc-5.3
  ln -s ../gcc53/bin/cpp cpp-5.3
  ln -s ../gcc53/bin/g++ g++-5.3
  ln -s ../gcc53/bin/gcc gcc-5.3
  ln -s ../gcc53/bin/gcc-ar gcc-ar-5.3
  ln -s ../gcc53/bin/gcc-nm gcc-nm-5.3
  ln -s ../gcc53/bin/gcc-ranlib gcc-ranlib-5.3
  ln -s ../gcc53/bin/gcov gcov-5.3
  cd $owd

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/gcc53/share/licenses/gcc-multilib/
#  ln -s ../gcc-libs-multilib/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/gcc53/share/licenses/gcc-multilib/
}

