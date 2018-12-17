# Original Core Repo
# ==================
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# Modificationt to use source from git master
# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>
#    * This PKGBUILD as closely as possible matches core's gcc 8.2.1+20180831-1

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=(gcc-git gcc-libs-git gcc-fortran-git gcc-objc-git gcc-ada-git gcc-go-git lib32-gcc-libs-gitb)
pkgver=9.0.0.r166204.2c4e6da263b
_majorver=${pkgver:0:1}
#this is set after pkgver() runs!  (Thanks makepkg!)
_basever=${pkgver%%.r*}
_islver=0.20
pkgrel=1
pkgdesc='The GNU Compiler Collection (git version)'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='http://gcc.gnu.org'
makedepends=(binutils libmpc gcc-ada doxygen lib32-glibc lib32-gcc-libs python git)
checkdepends=(dejagnu inetutils)
options=(!emptydirs)
#source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
source=(git+https://gcc.gnu.org/git/gcc.git
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        c89 c99)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              33C235A34C46AA3FFB293709A328C3A2C3C45C06) # Jakub Jelinek <jakub@redhat.com>
sha256sums=('SKIP'
            'b587e083eb65a8b394e833dea1744f21af3f0e413a448c17536b5549ae42a4c2'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a')

_svnrev=264010
_svnurl=svn://gcc.gnu.org/svn/gcc/branches/gcc-${_majorver}-branch
#also set after pkgver() runs!
_libdir=usr/lib/gcc/$CHOST/${_basever}

# snapshot() is only used by core's maintainers, so removing it here

pkgver() {
  cd gcc
  echo $(cat gcc/BASE-VER).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  #unlike a tarball, git clone will name the directory gcc
  #[[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
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

  #Revsion 261304 removed libmpx
  #https://gcc.gnu.org/viewcvs/gcc?view=revision&revision=261304
  #https://gcc.gnu.org/wiki/Intel%20MPX%20support%20in%20the%20GCC%20compiler
  #https://www.phoronix.com/scan.php?page=news_item&px=MPX-Removed-From-GCC9
  "$srcdir/gcc/configure" --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
      --enable-shared \
      --enable-threads=posix \
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
      --enable-cet=auto

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

package_gcc-libs-git() {
  pkgdesc='Runtime libraries shipped by GCC (git version)'
  groups=(base)
  depends=('glibc>=2.27')
  options+=(!strip)
  provides=(gcc-libs-multilib=${pkgver}-${pkgrel} libgo.so=${pkgver}-${pkgrel} libgfortran.so=${pkgver}-${pkgrel} libubsan.so=${pkgver}-${pkgrel} libasan.so=${pkgver}-${pkgrel}
            libtsan.so=${pkgver}-${pkgrel} liblsan.so=${pkgver}-${pkgrel} gcc-libs=${pkgver}-${pkgrel})
  conflicts=(gcc-libs)

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

  for lib in libgomp \
             libitm \
             libquadmath; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-info
  done

  # remove files provided by lib32-gcc-libs-gitb
  rm -rf "$pkgdir"/usr/lib32/

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/gcc-libs-git/RUNTIME.LIBRARY.EXCEPTION"
}

package_gcc-git() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (git version)"
  depends=("gcc-libs=$pkgver-$pkgrel" 'binutils>=2.28' libmpc)
  groups=('base-devel')
  optdepends=('lib32-gcc-libs: for generating code for 32-bit ABI')
  provides=(gcc-multilib=${pkgver}-${pkgrel} gcc=${pkgver}-${pkgrel})
  conflicts=(gcc)
  options+=(staticlibs)

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "$pkgdir/usr/bin/" gcc/gcov{,-tool}
  install -m755 -t "$pkgdir/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1}

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
  make -C $CHOST/32/libgomp DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/32/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/32/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS

  make -C libiberty DESTDIR="$pkgdir" install
  install -m644 libiberty/pic/libiberty.a "$pkgdir/usr/lib"

  make -C gcc DESTDIR="$pkgdir" install-man install-info
  rm "$pkgdir"/usr/share/man/man1/{gccgo,gfortran}.1
  rm "$pkgdir"/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn}.info

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc "$pkgdir"/usr/bin/cc

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99"

  # install the libstdc++ man pages
  make -C $CHOST/libstdc++-v3/doc DESTDIR="$pkgdir" doc-install-man

  # remove files provided by lib32-gcc-libs-gitb
  rm -f "$pkgdir"/usr/lib32/lib{stdc++,gcc_s}.so

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${_basever}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${_basever}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/gcc-git/"
  ln -s /usr/share/licenses/gcc-libs-git/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/gcc-git/"
}

package_gcc-fortran-git() {
  pkgdesc='Fortran front-end for GCC (git version)'
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gcc-fortran-multilib=${pkgver}-${pkgrel} gcc-fortran=${pkgver}-${pkgrel})
  conflicts=(gcc-fortran)

  cd gcc-build
  make -C $CHOST/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $CHOST/32/libgfortran DESTDIR=$pkgdir install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS}
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_fincludeHEADERS
  make -C gcc DESTDIR="$pkgdir" fortran.install-{common,man,info}
  install -Dm755 gcc/f951 "$pkgdir/${_libdir}/f951"

  ln -s gfortran "$pkgdir/usr/bin/f95"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/gcc-fortran-git/"
  ln -s /usr/share/licenses/gcc-libs-git/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/gcc-fortran-git/"
}

package_gcc-objc-git() {
  pkgdesc='Objective-C front-end for GCC (git version)'
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gcc-objc-multilib=${pkgver}-${pkgrel} gcc-objc=${pkgver}-${pkgrel})
  conflicts=(gcc-objc)

  cd gcc-build
  make DESTDIR="$pkgdir" -C $CHOST/libobjc install-headers
  install -dm755 "$pkgdir/${_libdir}"
  install -m755 gcc/cc1obj{,plus} "$pkgdir/${_libdir}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/gcc-objc-git/"
  ln -s /usr/share/licenses/gcc-libs-git/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/gcc-objc-git/"
}

package_gcc-ada-git() {
  pkgdesc='Ada front-end for GCC (GNAT) (git version)'
  depends=("gcc=$pkgver-$pkgrel")
  provides=(gcc-ada-multilib=${pkgver}-${pkgrel} gcc-ada=${pkgver}-${pkgrel})
  conflicts=(gcc-ada)
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
  install -d "$pkgdir/usr/share/licenses/gcc-ada-git/"
  ln -s /usr/share/licenses/gcc-libs-git/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/gcc-ada-git/"
}

package_gcc-go-git() {
  pkgdesc='Go front-end for GCC (git version)'
  depends=("gcc=$pkgver-$pkgrel")
  provides=("go=1.10.1" gcc-go-multilib gcc-go=${pkgver}-${pkgrel})
  conflicts=(go gcc-go)

  cd gcc-build
  make -C $CHOST/libgo DESTDIR="$pkgdir" install-exec-am
  make -C $CHOST/32/libgo DESTDIR="$pkgdir" install-exec-am
  make DESTDIR="$pkgdir" install-gotools
  make -C gcc DESTDIR="$pkgdir" go.install-{common,man,info}

  rm -f "$pkgdir"/usr/lib{,32}/libgo.so*
  install -Dm755 gcc/go1 "$pkgdir/${_libdir}/go1"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/gcc-go-git/"
  ln -s /usr/share/licenses/gcc-libs-git/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/gcc-go-git/"
}

package_lib32-gcc-libs-gitb() {
  pkgdesc='32-bit runtime libraries shipped by GCC (git version)'
  depends=('lib32-glibc>=2.27')
  provides=(libgo.so=${pkgver}-${pkgrel} libgfortran.so=${pkgver}-${pkgrel} libubsan.so=${pkgver}-${pkgrel} libasan.so=${pkgver}-${pkgrel} lib32-gcc-libs=${pkgver}-${pkgrel})
  conflicts=(lib32-gcc-libs)
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

  # remove files provided by gcc-libs
  rm -rf "$pkgdir"/usr/lib

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/lib32-gcc-libs-gitb/RUNTIME.LIBRARY.EXCEPTION"
}
