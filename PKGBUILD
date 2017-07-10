# Contributor: frankspace
# Contributor: Renan Manola <rmanola@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Based on a modified version of the gcc PKGBUILD
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: Joey Dumont <joey.dumont@gmail.com>

pkgbase=gcc6
_ver=6
pkgname=('gcc6' 'gcc6-libs' 'gcc6-fortran' 'gcc6-objc' 'gcc6-ada' 'gcc6-go' 'gcc6-gcj')
pkgver=6.4.0
pkgrel=1
_islver=0.17
_cloogver=0.18.4
_commit=45dd06cef49fe00a7839d7dff312b09e88910a51
pkgdesc="The GNU Compiler for Java"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://gcc.gnu.org"
depends=('gtk2' 'libxtst' 'alsa-lib' 'libmpc>=0.8.1' 'classpath')
makedepends=('binutils>=2.28' 'mpfr>=2.4.2' 'elfutils' 'jack' 'zip' 'libart-lgpl' 'gcc-ada' 'gcc-objc' 'gcc-go' 'gcc-fortran' 'git')
optdepends=('python2: for running /usr/bin/aot-compile'
  'java-environment: for runnig some jars')
options=('!libtool' '!makeflags')
source=("https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz"
        "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz")
sha512sums=('cfe9a009580c4043ea365155012104f73281778f9a79b8a596289d0344fedb808648a9ffd9d48687ad45b43c0ecb029d59cee789d58c17da3bd92db4554c5d46'
            '8a2a51d8acbf966c37868fd714ee46cf0b87e1f9d8d9d3148eb2c4b331b7170916d7392fee7fa0af73988a3b8583a6e937dd643b5a574b7e61a09c5bc3347c27'
            'd35d67b08ffe13c1a010b65bfe4dd02b0ae013d5b489e330dc950bd3514defca8f734bd37781856dcedf0491ff6122c34eecb4b0fe32a22d7e6bdadea98c8c23')

if [ "${CARCH}" = "x86_64" ]; then
    export CHOST=x86_64-pc-linux-gnu
elif [ "${CARCH}" = "i686" ]; then
    export CHOST=i686-pc-linux-gnu
fi
export _libdir="/usr/lib/gcc/$CHOST/$pkgver"

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
      --program-suffix=-${_ver}         \
      --build="${CHOST}"

  make
}

package_gcc6-libs() {

  pkgdesc="Runtime libraries shipped by GCC"
  depends=('glibc>=2.25')
  options=('!emptydirs' '!strip')

   cd ${srcdir}/gcc-${_commit}/gcc-build

   make -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
   rm ${pkgdir}/${_libdir}/libgcc_eh.a

   for lib in libatomic \
              libcilkrts \
              libgfortran \
              libgo \
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

   make -C $CHOST/libobjc DESTDIR=${pkgdir} install-libs

   make -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install

   make -C $CHOST/libmpx DESTDIR=${pkgdir} install
   rm ${pkgdir}/${_libdir}/libmpx.spec

   for lib in libgomp \
              libitm \
              libquadmath; do
     make -C $CHOST/$lib DESTDIR=${pkgdir} install-info
   done

   # Lazy way of dealing with conflicting files...
   rm -rf ${pkgdir}/usr/share/{info,locale,man}

   # Remove libs that conflict with gcc6_go.
   rm -rf ${pkgdir}/${_libdir}/libgo*

   # Install Runtime Library Exception
   install -Dm644 ${srcdir}/gcc-${_commit}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc6()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("gcc6-libs=${pkgver}-${pkgrel}" 'binutils>=2.28' 'libmpc')
  options=('staticlibs')

  cd ${srcdir}/gcc-${_commit}/gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  for _i in gcov gcov-dump gcov-tool collect2 collect-ld lto1
  do
    install -Dm755 gcc/$_i $pkgdir/usr/bin/${_i}-6
  done

  make -C $CHOST/libgcc DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/lib/libgcc_s.so*

  make -C $CHOST/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/python DESTDIR=${pkgdir} install
  rm ${pkgdir}/${_libdir}/libstdc++.so*

  make DESTDIR=${pkgdir} install-libcc1
  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib

  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders

  make -C lto-plugin DESTDIR=${pkgdir} install
  install -dm755 ${pkgdir}/usr/lib/bfd-plugins/
  ln -s ${_libdir}/liblto_plugin.so \
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
  make -C gcc DESTDIR=${pkgdir} install-po

  # many packages expect this symlink
  ln -s gcc-6 ${pkgdir}/usr/bin/cc-6

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/bin/c89-6 <<"EOF"
#!/bin/sh
fl="-std=c89"
for opt; do
  case "$opt" in
    -ansi|-std=c89|-std=iso9899:1990) fl="";;
    -std=*) echo "`basename $0` called with non ANSI/ISO C option $opt" >&2
            exit 1;;
  esac
done
exec gcc-6 $fl ${1+"$@"}
EOF

  cat > $pkgdir/usr/bin/c99-6 <<"EOF"
#!/bin/sh
fl="-std=c99"
for opt; do
  case "$opt" in
    -std=c99|-std=iso9899:1999) fl="";;
    -std=*) echo "`basename $0` called with non ISO C99 option $opt" >&2
            exit 1;;
  esac
done
exec gcc-6 $fl ${1+"$@"}
EOF

  chmod 755 $pkgdir/usr/bin/c{8,9}9-6

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname

  # Lazy way of dealing with conflicting files...
  rm -rf ${pkgdir}/usr/share/{info,locale,man}

  # Move potentially conflicting stuff to version specific subdirectory
  #[[ -d ${pkgdir}/usr/lib/gcc/${CHOST}/lib/ ]] && mv ${pkgdir}/usr/lib/gcc/${CHOST}/lib/lib* \
  #               ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  mv $pkgdir/usr/lib/bfd-plugins/liblto_plugin.so ${pkgdir}/usr/lib/bfd-plugins/liblto_plugin-6.so
  install -Dm755 gcc/cc1     ${pkgdir}/${_libdir}/${pkgver}/cc1
  install -Dm755 gcc/cc1plus ${pkgdir}/${_libdir}/${pkgver}/cc1plus
}

package_gcc6-fortran()
{
  pkgdesc="Fortran front-end for GCC"
  depends=("gcc6")
  options=('!emptydirs')

  cd ${srcdir}/gcc-${_commit}/gcc-build
  make -C $CHOST/libgfortran DESTDIR=$pkgdir install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -C gcc DESTDIR=$pkgdir fortran.install-common
  install -Dm755 gcc/f951 $pkgdir/${_libdir}/f951-6
  ln -s gfortran-6 ${pkgdir}/usr/bin/f95-6

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc6-objc()
{
  pkgdesc="Objective-C front-end for GCC"
  depends=("gcc6")

  cd ${srcdir}/gcc-${_commit}/gcc-build
  make DESTDIR=$pkgdir -C $CHOST/libobjc install-headers
  install -dm755 $pkgdir/${_libdir}
  install -m755 gcc/cc1obj $pkgdir/${_libdir}/cc1obj-6
  install -m755 gcc/cc1objplus $pkgdir/${_libdir}/cc1objplus-6

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc6-ada()
{
  pkgdesc="Ada front-end for GCC (GNAT)"
  depends=("gcc6")
  options=('staticlibs' '!emptydirs')
  _pkgver=${pkgver:0:1}
  cd ${srcdir}/gcc-${_commit}/gcc-build/gcc
  make DESTDIR=$pkgdir ada.install-common
  install -m755 gnat1 $pkgdir/${_libdir}/gnat1-6

  ln -s gcc-6 ${pkgdir}/usr/bin/gnatgcc-6

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv ${pkgdir}/${_libdir}/adalib/libgna{rl,t}-${_pkgver}.so ${pkgdir}/usr/lib
  rm ${pkgdir}/${_libdir}/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc6-go()
{
  pkgdesc="Go front-end for GCC"
  depends=("gcc6")
  conflicts=('go')
  options=('!emptydirs')

  cd ${srcdir}/gcc-${_commit}/gcc-build/

  make -C $CHOST/libgo DESTDIR=$pkgdir install-exec-am
  install -Dm755 gcc/go1 $pkgdir/${_libdir}/go1-6

  make DESTDIR=${pkgdir} install-gotools

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/$pkgname/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/$pkgname/
}

package_gcc6-gcj() {
  pkgdesc="Java front-end for GCC"
  depends=("gcc6")
  replaces=('gcc-gcj')
  options=('!emptydirs')

  # Install libjava.
  cd ${srcdir}/gcc-${_commit}/gcc-build
  make -j1 DESTDIR=${pkgdir} install-target-libjava

  # Install java-common.
  cd gcc
  make -j1 DESTDIR=${pkgdir} java.install-common java.install-man

  install -m755 jc1       ${pkgdir}/${_libdir}/
  install -m755 jvgenmain ${pkgdir}/${_libdir}/

  # Remove conflicting files.
  rm ${pkgdir}/usr/lib/gcc/${CHOST}/lib/libgcc_s.so*

  # Rename two files to not conflict to classpath
  mv ${pkgdir}/usr/share/info/cp-tools.info ${pkgdir}/usr/share/info/cp-tools-gcj.info

  linkdir=`basename $pkgdir/usr/lib/gcj-${pkgver}*`
  ln -sf $linkdir ${pkgdir}/usr/lib/gcj-${pkgver%.?}
  ln -sf libgcj-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-${pkgver%.?}.jar
  ln -sf libgcj-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj.jar
  ln -sf libgcj-tools-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-tools-${pkgver%.?}.jar
  ln -sf libgcj-tools-${pkgver}.jar ${pkgdir}/usr/share/java/libgcj-tools.jar

  rm ${pkgdir}/${_libdir}/libgcc_eh.a
  rm ${pkgdir}/${_libdir}/crtbegin.o
  rm ${pkgdir}/${_libdir}/crtbeginS.o
  rm ${pkgdir}/${_libdir}/crtbeginT.o
  rm ${pkgdir}/${_libdir}/crtend.o
  rm ${pkgdir}/${_libdir}/crtendS.o
  rm ${pkgdir}/${_libdir}/crtfastmath.o
  rm ${pkgdir}/${_libdir}/crtprec32.o
  rm ${pkgdir}/${_libdir}/crtprec64.o
  rm ${pkgdir}/${_libdir}/crtprec80.o
  rm ${pkgdir}/${_libdir}/include/unwind.h
  rm ${pkgdir}/${_libdir}/libgcc.a
  rm ${pkgdir}/${_libdir}/libgcov.a
}
