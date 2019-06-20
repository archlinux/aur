# Maintainer: Jingbei Li <i@jingbei.li>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgbase=gcc8
pkgname=(gcc8 gcc8-libs gcc8-fortran gcc8-objc gcc8-ada gcc8-go lib32-gcc8-libs)
pkgver=8.3.0
_ver=1
_majorver=${pkgver:0:1}
_islver=0.21
pkgrel=1
pkgdesc='The GNU Compiler Collection'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(binutils libmpc gcc-ada doxygen lib32-glibc lib32-gcc-libs python subversion)
checkdepends=(dejagnu inetutils)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz
        https://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        c89 c99)
sha256sums=('64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c'
            '939f524d62ea7738c505aee4cb355107c57c3cc748fa90af2092cf9925687839'
            '1ec3372373d0e20b9f32057c0e90ad776086f5d407b388b78b9699a272bf5a3f'
            '30e17222514da5a225272aca3da79bdf3e088656a6a00a7cc6ceab91bea1e032')

_svnrev=264010
_svnurl=svn://gcc.gnu.org/svn/gcc/branches/gcc-${_majorver}-branch
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  mkdir -p "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  "$srcdir/gcc/configure" --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
      --enable-shared \
      --enable-threads=posix \
      --enable-libmpx \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --enable-linker-build-id \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --enable-gnu-indirect-function \
      --enable-multilib \
      --disable-werror \
      --enable-checking=release \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-cet=auto \
      --program-suffix=-${_ver}

  make

  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

check() {
  cd gcc-build

  # do not abort on error as some are "expected"
  make -k check || true
  "$srcdir/gcc/contrib/test_summary"
}

package_gcc8-libs() {
  pkgdesc='Runtime libraries shipped by GCC'
  groups=(base)
  depends=('glibc>=2.27')
  options+=(!strip)
  provides=($pkgname-multilib libgo.so libgfortran.so libubsan.so libasan.so
            libtsan.so liblsan.so)
  replaces=($pkgname-multilib)

  cd gcc-build
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/libgcc_eh.a"

  for lib in libatomic \
             libgfortran \
             libgo \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub,t}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  done

  make -C $CHOST/libobjc DESTDIR="$pkgdir" install-libs
  make -C $CHOST/libstdc++-v3/po DESTDIR="$pkgdir" install
  make -C $CHOST/libmpx DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/lib/libmpx.spec"

  for lib in libgomp \
             libitm \
             libquadmath; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-info
  done

  # remove files provided by lib32-gcc-libs
  rm -rf "$pkgdir"/usr/lib32/

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION"
}

package_gcc8() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("gcc8-libs=$pkgver-$pkgrel" 'binutils>=2.28' libmpc)
  groups=('base-devel')
  optdepends=('lib32-gcc8-libs: for generating code for 32-bit ABI')
  provides=($pkgname-multilib)
  replaces=($pkgname-multilib)
  options+=(staticlibs)

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "$pkgdir/usr/bin/" gcc/gcov{,-tool}-${_ver}
  install -m755 -t "$pkgdir/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1}-${_ver}

  make -C $CHOST/libgcc DESTDIR="$pkgdir" install
  make -C $CHOST/32/libgcc DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib{,32}/libgcc_s.so*

  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/python DESTDIR="$pkgdir" install
  make -C $CHOST/32/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/32/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/32/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install

  make DESTDIR="$pkgdir" install-libcc1
  install -d "$pkgdir/usr/share/gdb/auto-load/usr/lib"
  mv "$pkgdir"/usr/lib/libstdc++.so.6.*-gdb.py \
    "$pkgdir/usr/share/gdb/auto-load/usr/lib/"
  rm "$pkgdir"/usr/lib{,32}/libstdc++.so*

  make DESTDIR="$pkgdir" install-fixincludes
  make -C gcc DESTDIR="$pkgdir" install-mkheaders

  make -C lto-plugin DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/usr/lib/bfd-plugins/
  ln -s /${_libdir}/liblto_plugin.so \
    "$pkgdir/usr/lib/bfd-plugins/"

  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -C $CHOST/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR="$pkgdir" install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/tsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/lsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libmpx DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libgomp DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/32/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libmpx DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS

  make -C libiberty DESTDIR="$pkgdir" install
  install -m644 libiberty/pic/libiberty.a "$pkgdir/usr/lib"

  make -C gcc DESTDIR="$pkgdir" install-man install-info
  rm "$pkgdir"/usr/share/man/man1/{gccgo,gfortran}-${_ver}.1
  rm "$pkgdir"/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn}.info

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc-${_ver} ${pkgdir}/usr/bin/cc-${_ver}

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89-${_ver}"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99-${_ver}"

  # install the libstdc++ man pages
  make -C $CHOST/libstdc++-v3/doc DESTDIR="$pkgdir" doc-install-man

  # remove files provided by lib32-gcc-libs
  rm -f "$pkgdir"/usr/lib32/lib{stdc++,gcc_s}.so

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # Move potentially conflicting stuff to version specific subdirectory
  mv $pkgdir/usr/lib/bfd-plugins/liblto_plugin.so ${pkgdir}/usr/lib/bfd-plugins/liblto_plugin-${_ver}.so
}

package_gcc8-fortran() {
  pkgdesc='Fortran front-end for GCC'
  depends=("gcc8=$pkgver-$pkgrel")
  provides=($pkgname-multilib)
  replaces=($pkgname-multilib)

  cd gcc-build
  make -C $CHOST/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $CHOST/32/libgfortran DESTDIR=$pkgdir install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_fincludeHEADERS
  make -C gcc DESTDIR="$pkgdir" fortran.install-{common,man,info}
  install -Dm755 gcc/f951 "$pkgdir/${_libdir}/f951"

  ln -s gfortran "$pkgdir/usr/bin/f95-${_ver}"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc8-objc() {
  pkgdesc='Objective-C front-end for GCC'
  depends=("gcc8=$pkgver-$pkgrel")
  provides=($pkgname-multilib)
  replaces=($pkgname-multilib)

  cd gcc-build
  make DESTDIR="$pkgdir" -C $CHOST/libobjc install-headers
  install -dm755 "$pkgdir/${_libdir}"
  install -m755 gcc/cc1obj{,plus} "$pkgdir/${_libdir}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc8-ada() {
  pkgdesc='Ada front-end for GCC (GNAT)'
  depends=("gcc8=$pkgver-$pkgrel")
  provides=($pkgname-multilib)
  replaces=($pkgname-multilib)
  options+=(staticlibs)

  cd gcc-build/gcc
  make DESTDIR="$pkgdir" ada.install-{common,info}
  install -m755 gnat1 "$pkgdir/${_libdir}"

  cd "$srcdir"/gcc-build/$CHOST/32/libada
  make DESTDIR=${pkgdir} INSTALL="install" \
    INSTALL_DATA="install -m644" install-gnatlib

  ln -s gcc "$pkgdir/usr/bin/gnatgcc"

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv "$pkgdir"/${_libdir}/adalib/libgna{rl,t}-${_majorver}.so "$pkgdir/usr/lib"
  ln -s libgnarl-${_majorver}.so "$pkgdir/usr/lib/libgnarl.so"
  ln -s libgnat-${_majorver}.so "$pkgdir/usr/lib/libgnat.so"
  rm -f "$pkgdir"/${_libdir}/adalib/libgna{rl,t}.so

  install -d "$pkgdir/usr/lib32/"
  mv "$pkgdir"/${_libdir}/32/adalib/libgna{rl,t}-${_majorver}.so "$pkgdir/usr/lib32"
  ln -s libgnarl-${_majorver}.so "$pkgdir/usr/lib32/libgnarl.so"
  ln -s libgnat-${_majorver}.so "$pkgdir/usr/lib32/libgnat.so"
  rm -f "$pkgdir"/${_libdir}/32/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc8-go() {
  pkgdesc='Go front-end for GCC'
  depends=("gcc8=$pkgver-$pkgrel")
  provides=("go=1.10.1" $pkgname-multilib)
  replaces=($pkgname-multilib)
  conflicts=(go)

  cd gcc-build
  make -C $CHOST/libgo DESTDIR="$pkgdir" install-exec-am
  make -C $CHOST/32/libgo DESTDIR="$pkgdir" install-exec-am
  make DESTDIR="$pkgdir" install-gotools
  make -C gcc DESTDIR="$pkgdir" go.install-{common,man,info}

  rm -f "$pkgdir"/usr/lib{,32}/libgo.so*
  install -Dm755 gcc/go1 "$pkgdir/${_libdir}/go1"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_lib32-gcc8-libs() {
  pkgdesc='32-bit runtime libraries shipped by GCC'
  depends=('lib32-glibc>=2.27')
  provides=(libgo.so libgfortran.so libubsan.so libasan.so)
  groups=(multilib-devel)
  options=(!emptydirs !strip)

  cd gcc-build

  make -C $CHOST/32/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/32/libgcc_eh.a"

  for lib in libatomic \
             libgfortran \
             libgo \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/32/$lib DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  done

  make -C $CHOST/32/libobjc DESTDIR="$pkgdir" install-libs
  make -C $CHOST/32/libmpx DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/lib32/libmpx.spec"

  # remove files provided by gcc-libs
  rm -rf "$pkgdir"/usr/lib

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
