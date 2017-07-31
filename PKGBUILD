# Contributor: Joey Dumont <joey.dumont@gmail.com>
# Contributor: frankspace
# Contributor: Renan Manola <rmanola@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Based on a modified version of the gcc PKGBUILD
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=gcc63
_ver=6.3
pkgname=('gcc63' 'gcc63-fortran' 'gcc63-objc' 'gcc63-ada' 'gcc63-go' 'gcc63-gcj')
pkgver=6.3.1
pkgrel=5
_islver=0.17
_cloogver=0.18.4
_commit=4ca53f06ff7d346ef8021a23108f23a5406a0417
pkgdesc="The GNU Compiler for Java"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('gtk2' 'libxtst' 'alsa-lib' 'libmpc>=0.8.1' 'classpath')
makedepends=('mpfr>=2.4.2' 'elfutils' 'jack' 'zip' 'libart-lgpl' 'gcc-ada' 'gcc-objc' 'gcc-go' 'gcc-fortran' 'git')
optdepends=('python2: for running /usr/bin/aot-compile'
  'java-environment: for runnig some jars')
options=('!libtool' '!makeflags')
source=("https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
	"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz")
md5sums=('e65d06ed7c00e68bc84f6989752a09eb'
         '47dcb4fc963a9a625ccb47b72a167ffa'
         'e531f725244856c92c9bba009ff44faf')

if [ "${CARCH}" = "x86_64" ]; then
    export CHOST=x86_64-pc-linux-gnu
elif [ "${CARCH}" = "i686" ]; then
    export CHOST=i686-pc-linux-gnu
fi
_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
  cd "$srcdir"/gcc-${_commit}/

  # Link isl/cloog for in-tree builds
  ln -sf ../isl-${_islver} isl
  ln -sf ../cloog-${_cloogver} cloog
  
  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # Arch uses python version 3 as default python
  sed -i '1s+python+python2+' libjava/contrib/aot-compile.in

  [ -d gcc-build ] || mkdir gcc-build

}

build() {

  # Configure and build gcc-gcj.
  cd ${srcdir}/gcc-${_commit}/gcc-build

  ../configure                          \
      --prefix=/usr                     \
      --enable-shared                   \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++,java           \
      --enable-threads=posix            \
      --mandir=/usr/share/man           \
      --infodir=/usr/share/info         \
      --enable-__cxa_atexit             \
      --disable-multilib                \
      --libdir=/usr/lib                 \
      --libexecdir=/usr/lib             \
      --enable-clocale=gnu              \
      --disable-libstdcxx-pch           \
      --with-tune=generic               \
      --enable-java-awt=gtk             \
      --with-java-home="$JAVA_HOME"     \
      --enable-libgcj-multifile         \
      --disable-plugin                  \
      --with-system-zlib                \
      --enable-cloog-backend=isl        \
      --enable-install-libiberty \
      --enable-version-specific-runtime-libs \
      --program-suffix=-${_ver}

  make
}

# package_gcc63-libs()
# {
#   pkgdesc="Runtime libraries shipped by GCC"
#   groups=('base')
#   depends=('glibc>=2.25')
#   options=('!emptydirs' '!strip')

#   cd ${srcdir}/gcc-${_commit}/gcc-build

#   make -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared

#   for lib in libatomic \
#              libcilkrts \
#              libgfortran \
#              libgo \
#              libgomp \
#              libitm \
#              libquadmath \
#              libsanitizer/{a,l,ub}san \
#              libstdc++-v3/src \
#              libvtv; do
#     make -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
#   done

#   [[ $CARCH == "x86_64" ]] && \
#     make -C $CHOST/libsanitizer/tsan DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES

#   make -C $CHOST/libobjc DESTDIR=${pkgdir} install-libs

#   make -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install

#   make -C $CHOST/libmpx DESTDIR=${pkgdir} install
#   rm ${pkgdir}/usr/lib/libmpx.spec

#   for lib in libgomp \
#              libitm \
#              libquadmath; do
#     make -C $CHOST/$lib DESTDIR=${pkgdir} install-info
#   done

#   # Install Runtime Library Exception
#   install -Dm644 ${srcdir}/gcc-${_commit}/COPYING.RUNTIME \
# 	  ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
#   rm ${pkgdir}/usr/lib/gcc/x86_64-pc-linux-gnu/6.3.1/libgcc_eh.a
# }

package_gcc63()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("gcc-libs" 'binutils>=2.28' 'libmpc')
  groups=('base-devel')
  options=('staticlibs')
  
  cd ${srcdir}/gcc-${_commit}/gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  for _i in gcov gcov-dump gcov-tool collect2 collect-ld lto1
  do
    install -Dm755 gcc/$_i $pkgdir/usr/bin/${_i}-6.3
  done
  
  make -C $CHOST/libgcc DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/python DESTDIR=${pkgdir} install

  make DESTDIR=${pkgdir} install-libcc1
  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
  
  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders

  make -C lto-plugin DESTDIR=${pkgdir} install
  install -dm755 ${pkgdir}/usr/lib/bfd-plugins/
  ln -s /usr/lib/gcc/$CHOST/${pkgver}/liblto_plugin.so \
    ${pkgdir}/usr/lib/bfd-plugins/

  make -C $CHOST/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_cilkincludeHEADERS
  make -C $CHOST/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_libsubincludeHEADERS
  make -C $CHOST/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR=${pkgdir} install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR=${pkgdir} install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/libmpx DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS

  make -C libcpp DESTDIR=${pkgdir} install
 
  # many packages expect this symlink
  ln -s gcc-6.3 ${pkgdir}/usr/bin/cc-6.3

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/bin/c89-6.3 <<"EOF"
#!/bin/sh
fl="-std=c89"
for opt; do
  case "$opt" in
    -ansi|-std=c89|-std=iso9899:1990) fl="";;
    -std=*) echo "`basename $0` called with non ANSI/ISO C option $opt" >&2
            exit 1;;
  esac
done
exec gcc-6.3 $fl ${1+"$@"}
EOF

  cat > $pkgdir/usr/bin/c99-6.3 <<"EOF"
#!/bin/sh
fl="-std=c99"
for opt; do
  case "$opt" in
    -std=c99|-std=iso9899:1999) fl="";;
    -std=*) echo "`basename $0` called with non ISO C99 option $opt" >&2
            exit 1;;
  esac
done
exec gcc-6.3 $fl ${1+"$@"}
EOF

  chmod 755 $pkgdir/usr/bin/c{8,9}9-6.3

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname
  
  # Lazy way of dealing with conflicting files...
  rm -rf ${pkgdir}/usr/share/{info,locale,man}

  # Move potentially conflicting stuff to version specific subdirectory
  [[ -d ${pkgdir}/usr/lib/gcc/${CHOST}/lib/ ]] && mv ${pkgdir}/usr/lib/gcc/${CHOST}/lib/lib* \
						     ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  mv $pkgdir/usr/lib/bfd-plugins/liblto_plugin.so ${pkgdir}/usr/lib/bfd-plugins/liblto_plugin-6.3.so
  install -Dm755 gcc/cc1 ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/cc1
  install -Dm755 gcc/cc1plus ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/cc1plus
}

package_gcc63-fortran()
{
  pkgdesc="Fortran front-end for GCC"
  depends=("gcc63")
  options=('!emptydirs')

  cd ${srcdir}/gcc-${_commit}/gcc-build
  make -C $CHOST/libgfortran DESTDIR=$pkgdir install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -C gcc DESTDIR=$pkgdir fortran.install-common
  install -Dm755 gcc/f951 $pkgdir/${_libdir}/f951-6.3
  ln -s gfortran-6.3 ${pkgdir}/usr/bin/f95-6.3

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc63-objc()
{
  pkgdesc="Objective-C front-end for GCC"
  depends=("gcc63")

  cd ${srcdir}/gcc-${_commit}/gcc-build
  make DESTDIR=$pkgdir -C $CHOST/libobjc install-headers
  install -dm755 $pkgdir/${_libdir}
  install -m755 gcc/cc1obj $pkgdir/${_libdir}/cc1obj-6.3
  install -m755 gcc/cc1objplus $pkgdir/${_libdir}/cc1objplus-6.3

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc63-ada()
{
  pkgdesc="Ada front-end for GCC (GNAT)"
  depends=("gcc63")
  options=('staticlibs' '!emptydirs')
  _pkgver=${pkgver:0:1}
  cd ${srcdir}/gcc-${_commit}/gcc-build/gcc
  make DESTDIR=$pkgdir ada.install-common
  install -m755 gnat1 $pkgdir/${_libdir}/gnat1-6.3

  ln -s gcc-6.3 ${pkgdir}/usr/bin/gnatgcc-6.3

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv ${pkgdir}/${_libdir}/adalib/libgna{rl,t}-${_pkgver}.so ${pkgdir}/usr/lib
  rm ${pkgdir}/${_libdir}/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc63-go()
{
  pkgdesc="Go front-end for GCC"
  depends=("gcc63")
  conflicts=('go')
  options=('!emptydirs')

  cd ${srcdir}/gcc-${_commit}/gcc-build/

  make -C $CHOST/libgo DESTDIR=$pkgdir install-exec-am
  install -Dm755 gcc/go1 $pkgdir/${_libdir}/go1-6.3

  make DESTDIR=${pkgdir} install-gotools

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc63-gcj() {
  pkgdesc="Java front-end for GCC"
  depends=("gcc63")
  options=('!emptydirs')
  # Install libjava.
  cd ${srcdir}/gcc-${_commit}/gcc-build
  make -j1 DESTDIR=${pkgdir} install-target-libjava

  # Install java-common.
  cd gcc
  make -j1 DESTDIR=${pkgdir} java.install-common java.install-man

  install -m755 jc1       ${pkgdir}/usr/lib/gcc/$CHOST/${pkgver}/
  install -m755 jvgenmain ${pkgdir}/usr/lib/gcc/$CHOST/${pkgver}/

  # Rename two files to not conflict to classpath
  mv ${pkgdir}/usr/share/info/cp-tools.info ${pkgdir}/usr/share/info/cp-tools-gcj.info

  linkdir=`basename $pkgdir/usr/lib/gcj-${pkgver}*`
  ln -sf $linkdir ${pkgdir}/usr/lib/gcj-${pkgver%.?}
  ln -sf libgcj-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-${pkgver%.?}.jar
  ln -sf libgcj-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj.jar
  ln -sf libgcj-tools-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-tools-${pkgver%.?}.jar
  ln -sf libgcj-tools-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-tools.jar
  
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/libgcc_eh.a
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtbegin.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtbeginS.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtbeginT.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtend.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtendS.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtfastmath.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtprec32.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtprec64.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/crtprec80.o
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/include/unwind.h
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/libgcc.a
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/6.3.1/libgcov.a
}
