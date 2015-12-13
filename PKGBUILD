# $Id$
# Original Core Repo
# ==================
# Maintainer: Allan McRae <allan@archlinux.org>

# Modifications to Use Git Master Source
# ======================================
# Maintainer: James Harvey <jamespharvey20@gmail.com>
#    * This PKGBUILD as closely as possible matches core's gcc 5.3.0-2
#    * All namcap warnings are essentially identical, as of 6.0.0.r143486.3afbcf4, except:
#       * Error of a missing custom license directory of /usr/share/licenses/gcc*-git
#       * Symlink /usr/lib/bfd-plugins/liblto_plugin.so points to non-existing /usr/lib/gcc/x86_64-pc-linux-gnu/6.0.0.r140049.cab0d20/liblto_plugin.so -- will be fixing this
#       * gcc-go-git gives a "Referenced library 'libgo.so.8' is an uninstalled dependency -- will be looking into this
#    * _pkgver_base is hard coded at the moment to 6.0.0; can't parse from source at that point

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=('gcc-git' 'gcc-libs-git' 'gcc-fortran-git' 'gcc-objc-git' 'gcc-ada-git' 'gcc-go-git')
_pkgname=gcc
pkgver=6.0.0.r139654.12dcc3b
_pkgver_base=6.0.0
_pkgver=6
_islver=0.15
pkgrel=1

pkgdesc="The GNU Compiler Collection (developmental version)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.25' 'libmpc' 'gcc-ada' 'doxygen' 'git')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=(git://gcc.gnu.org/git/gcc.git
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
md5sums=('SKIP'
         '8428efbbc6f6e2810ce5c1ba73ecf98c')

_basedir=${_pkgname}

# CHOST is in the form <architecture>-<vendor>-<operatingSystem>-<cLibrary>
# Arch currently reports CHOST with vendor "unknown".  GCC expected this until recently, and on my machine is expecting "pc".
# Core's gcc and this package define arch to only be 'i686' or 'x86_64', so this workaround should work for whatever architecture is expected to be given.
# It is unknown to me if gcc will see everyone running arch as vendor "pc", or if it will see "softfloat", "hardfloat", or "unknown" here.
# (You may have to change the value of _CHOST.)
# Rather than having an else cause an error, I'm letting it go through, on the hopes that whatever is defined might work.
_CHOST=${CHOST}
if [[ "${CHOST}" == 'x86_64-unknown-linux-gnu' ]]; then
  _CHOST='x86_64-pc-linux-gnu'
elif [[ "${CHOST}" == 'i686-unknown-linux-gnu' ]]; then
  _CHOST='i686-pc-linux-gnu'
fi

_libdir="usr/lib/gcc/$_CHOST/$_pkgver_base"

pkgver() {
  cd ${srcdir}/gcc
  echo $(cat gcc/BASE-VER).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix --enable-libmpx \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release

  make
  
  # make documentation
  make -C $_CHOST/libstdc++-v3/doc doc-man-doxygen
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

package_gcc-libs-git()
{
  pkgdesc="Runtime libraries shipped by GCC (developmental version)"
  groups=('base')
  depends=('glibc>=2.22')
  provides=('gcc-libs')
  conflicts=('gcc-libs')
  options=('!emptydirs' '!strip')
  install=gcc-libs.install

  cd ${srcdir}/gcc-build
  
  make -C $_CHOST/libgcc DESTDIR=${pkgdir} install-shared
  rm ${pkgdir}/${_libdir}/libgcc_eh.a
  
  for lib in libatomic \
             libcilkrts \
             libgfortran \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $_CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  [[ $CARCH == "x86_64" ]] && \
    make -C $_CHOST/libsanitizer/tsan DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES

  make -C $_CHOST/libobjc DESTDIR=${pkgdir} install-libs

  make -C $_CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install

  make -C $_CHOST/libmpx DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/lib/libmpx.spec

  for lib in libgomp \
             libitm \
             libquadmath; do
    make -C $_CHOST/$lib DESTDIR=${pkgdir} install-info
  done

  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-git()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (developmental version)"
  depends=("gcc-libs-git=$pkgver-$pkgrel" 'binutils>=2.25' 'libmpc')
  provides=('gcc')
  conflicts=('gcc')
  groups=('base-devel')
  options=('staticlibs')
  install=gcc.install

  cd ${srcdir}/gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t $pkgdir/usr/bin/ gcc/gcov{,-tool}
  install -m755 -t $pkgdir/${_libdir}/ gcc/{cc1,cc1plus,collect2,lto1}

  make -C $_CHOST/libgcc DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/lib/libgcc_s.so*
  
  make -C $_CHOST/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C $_CHOST/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C $_CHOST/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make -C $_CHOST/libstdc++-v3/python DESTDIR=${pkgdir} install

  make DESTDIR=${pkgdir} install-libcc1
  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
  mv $pkgdir/usr/lib/libstdc++.so.6.*-gdb.py \
    $pkgdir/usr/share/gdb/auto-load/usr/lib/
  rm ${pkgdir}/usr/lib/libstdc++.so*

  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders
  
  make -C lto-plugin DESTDIR=${pkgdir} install
  install -dm755 ${pkgdir}/usr/lib/bfd-plugins/
  ln -s /usr/lib/gcc/$_CHOST/${pkgver}/liblto_plugin.so \
    ${pkgdir}/usr/lib/bfd-plugins/

  make -C $_CHOST/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_cilkincludeHEADERS
  make -C $_CHOST/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_libsubincludeHEADERS
  make -C $_CHOST/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $_CHOST/libquadmath DESTDIR=${pkgdir} install-nodist_libsubincludeHEADERS
  make -C $_CHOST/libsanitizer DESTDIR=${pkgdir} install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $_CHOST/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $_CHOST/libmpx DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS

  make -C libiberty DESTDIR=${pkgdir} install
  # install PIC version of libiberty
  install -m644 ${srcdir}/gcc-build/libiberty/pic/libiberty.a ${pkgdir}/usr/lib

  make -C gcc DESTDIR=${pkgdir} install-man install-info
  rm ${pkgdir}/usr/share/man/man1/{gccgo,gfortran}.1
  rm ${pkgdir}/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn}.info

  make -C libcpp DESTDIR=${pkgdir} install
  make -C gcc DESTDIR=${pkgdir} install-po

  # many packages expect this symlink
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
  make -C $_CHOST/libstdc++-v3/doc DESTDIR=$pkgdir doc-install-man

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc/
}

package_gcc-fortran-git()
{
  pkgdesc="Fortran front-end for GCC (developmental version)"
  # Addition of libmpc and zlib depends, due to new requirements of /usr/lib/gcc/x86_64-unknown-linux-gnu/6.0.0/f951
  depends=("gcc-git=$pkgver-$pkgrel" 'libmpc' 'zlib')
  provides=('gcc-fortran')
  conflicts=('gcc-fortran')
  options=('!emptydirs')
  install=gcc-fortran.install

  cd ${srcdir}/gcc-build
  # install-myexeclibLTLIBRARIES omitted because it was removed upstream
  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=40267
  make -C $_CHOST/libgfortran DESTDIR=$pkgdir install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $_CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -C gcc DESTDIR=$pkgdir fortran.install-{common,man,info}
  install -Dm755 gcc/f951 $pkgdir/${_libdir}/f951

  ln -s gfortran ${pkgdir}/usr/bin/f95

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-fortran/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-fortran/
}

package_gcc-objc-git()
{
  pkgdesc="Objective-C front-end for GCC (developmental version)"
  # Addition of libmpc and zlib depends, due to new requirements of /usr/lib/gcc/x86_64-unknown-linux-gnu/6.0.0/gnat1
  depends=("gcc-git=$pkgver-$pkgrel" 'libmpc' 'zlib')
  provides=('gcc-objc')
  conflicts=('gcc-objc')

  cd ${srcdir}/gcc-build
  make DESTDIR=$pkgdir -C $_CHOST/libobjc install-headers
  install -dm755 $pkgdir/${_libdir}
  install -m755 gcc/cc1obj{,plus} $pkgdir/${_libdir}/

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-objc/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-objc/
}

package_gcc-ada-git()
{
  pkgdesc="Ada front-end for GCC (GNAT) (developmental version)"
  # Addition of libmpc and zlib depends, due to new requirements of /usr/lib/gcc/x86_64-unknown-linux-gnu/6.0.0/gnat1
  depends=("gcc-git=$pkgver-$pkgrel" 'libmpc' 'zlib')
  provides=('gcc-ada')
  conflicts=('gcc-ada')
  options=('staticlibs' '!emptydirs')
  install=gcc-ada.install

  cd ${srcdir}/gcc-build/gcc
  make DESTDIR=$pkgdir ada.install-{common,info}
  install -m755 gnat1 $pkgdir/${_libdir}

  ln -s gcc ${pkgdir}/usr/bin/gnatgcc

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv ${pkgdir}/${_libdir}/adalib/libgna{rl,t}-${_pkgver}.so ${pkgdir}/usr/lib
  ln -s libgnarl-${_pkgver}.so ${pkgdir}/usr/lib/libgnarl.so
  ln -s libgnat-${_pkgver}.so ${pkgdir}/usr/lib/libgnat.so
  rm ${pkgdir}/${_libdir}/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-ada/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-ada/
}

package_gcc-go-git()
{
  pkgdesc="Go front-end for GCC (developmental version)"
  # Addition of libmpc and zlib depends, due to new requirements of /usr/lib/gcc/x86_64-unknown-linux-gnu/6.0.0/go1
  depends=("gcc-git=$pkgver-$pkgrel" 'libmpc' 'zlib')
  provides=('gcc-go')
  conflicts=('go', 'gcc-go')
  options=('!emptydirs')
  install=gcc-go.install

  cd ${srcdir}/gcc-build
  make -C $_CHOST/libgo DESTDIR=$pkgdir install-exec-am
  make -C gcc DESTDIR=$pkgdir go.install-{common,man,info}
  install -Dm755 gcc/go1 $pkgdir/${_libdir}/go1

  make DESTDIR=${pkgdir} install-gotools

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-go/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-go/
}
