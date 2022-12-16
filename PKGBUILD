# Merged with official ABS gcc PKGBUILD by João, 2021/08/03 (all respective contributors apply herein)
# Co-Maintainer: Peter Jung & CachyOS <admin@ptr1337.dev>
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc
# NOTE: libtool requires rebuilt with each new gcc version

# You probably don't need support for all the languages, feel free to remove the ones you don't;
# Just edit the --enable-languages option as well as the pkgname array, and comment out the pkg functions :)

pkgbase=gcc-git
pkgname=({gcc,gcc-libs,lib32-gcc-libs,gcc-fortran,gcc-rust,gcc-objc,gcc-ada,gcc-d,lto-dump,gcc-go,libgccjit}-git)
pkgver=13.0.0_r197401.g33be3ee36a7
_majorver=${pkgver%%.*}
pkgrel=1
pkgdesc='The GNU Compiler Collection'
arch=(x86_64)
license=(GPL3 LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(
  binutils
  doxygen
  gcc-ada
  gcc-d
  git
  lib32-glibc
  lib32-gcc-libs
  libisl
  libmpc
  libxcrypt
  python
  zstd
)
checkdepends=(
  dejagnu
  expect
  inetutils
  python-pytest
  tcl
)
options=(!emptydirs !lto !debug)
_libdir=usr/lib/gcc/$CHOST/${pkgver%_*}
source=(git://gcc.gnu.org/git/gcc.git
  c89 c99
  gcc-ada-repro.patch
)
sha256sums=('SKIP'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a'
            '1773f5137f08ac1f48f0f7297e324d5d868d55201c03068670ee4602babdef2f')

pkgver() {
  cd ${pkgbase%-git}
  echo "$(cat gcc/BASE-VER)_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # Reproducible gcc-ada
  patch -Np0 < "$srcdir/gcc-ada-repro.patch"

  mkdir -p "$srcdir/gcc-build"
  mkdir -p "$srcdir/libgccjit-build"
}

build() {
  local _confflags=(
      --prefix=/usr
      --libdir=/usr/lib
      --libexecdir=/usr/lib
      --mandir=/usr/share/man
      --infodir=/usr/share/info
      --with-bugurl=https://bugs.archlinux.org/
      --with-build-config=bootstrap-lto
      --with-linker-hash-style=gnu
      --with-system-zlib
      --enable-__cxa_atexit
      --enable-cet=auto
      --enable-checking=release
      --enable-clocale=gnu
      --enable-default-pie
      --enable-default-ssp
      --enable-gnu-indirect-function
      --enable-gnu-unique-object
      --enable-libstdcxx-backtrace
      --enable-link-serialization=1
      --enable-linker-build-id
      --enable-lto
      --enable-multilib
      --enable-plugin
      --enable-shared
      --enable-threads=posix
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-werror
  )

  cd gcc-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir/gcc/configure" \
    --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++,d,rust \
    --enable-bootstrap \
    "${_confflags[@]:?_confflags unset}"

  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
  make -O STAGE1_CFLAGS="-O2" \
          BOOT_CFLAGS="$CFLAGS" \
          BOOT_LDFLAGS="$LDFLAGS" \
          LDFLAGS_FOR_TARGET="$LDFLAGS" \
          bootstrap

  # make documentation
  make -O -C $CHOST/libstdc++-v3/doc doc-man-doxygen

  # Build libgccjit separately, to avoid building all compilers with --enable-host-shared
  # which brings a performance penalty
  cd "${srcdir}"/libgccjit-build

  "$srcdir/gcc/configure" \
    --enable-languages=jit \
    --disable-bootstrap \
    --enable-host-shared \
    "${_confflags[@]:?_confflags unset}"

  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
  make -O STAGE1_CFLAGS="-O2" \
          BOOT_CFLAGS="$CFLAGS" \
          BOOT_LDFLAGS="$LDFLAGS" \
          LDFLAGS_FOR_TARGET="$LDFLAGS" \
          all-gcc

  cp -a gcc/libgccjit.so* ../gcc-build/gcc/
}

check() {
  cd gcc-build

  # disable libphobos test to avoid segfaults
  sed -i '/maybe-check-target-libphobos \\/d' Makefile

  # do not abort on error as some are "expected"
  make -O -k check || true
  "$srcdir/gcc/contrib/test_summary"
}
package_gcc-libs-git() {
  pkgdesc='Runtime libraries shipped by GCC (git version)'
  depends=('glibc>=2.27')
  options=(!emptydirs !strip)
  provides=("gcc-libs-git=$pkgver-$pkgrel" gcc-libs gcc-multilib{,-git} libgo.so libgfortran.so
  libubsan.so libasan.so libtsan.so liblsan.so libgphobos.so)
  conflicts=(gcc-libs)
  replaces=(gcc-multilib-git libgphobos)

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

  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/$_libdir/include/d/
  rm -f "$pkgdir"/usr/lib/libgphobos.spec

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

package_gcc-git() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (git version)"
  depends=("gcc-libs-git=$pkgver-$pkgrel" "binutils>=2.28" libmpc zstd libisl.so)
  groups=(base-devel-git)
  optdepends=('lib32-gcc-libs-git: for generating code for 32-bit ABI')
  provides=(gcc{,-multilib{,-git}})
  conflicts=(gcc)
  replaces=(gcc-multilib-git)
  options=(!emptydirs staticlibs debug)

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

  make -C gcc DESTDIR="$pkgdir" install-man install-info
  rm "$pkgdir"/usr/share/man/man1/{gccgo,gfortran,lto-dump,gdc}.1
  rm "$pkgdir"/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn,gdc}.info

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc "$pkgdir"/usr/bin/cc

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99"

  # install the libstdc++ man pages
  make -C $CHOST/libstdc++-v3/doc DESTDIR="$pkgdir" doc-install-man

  # remove files provided by lib32-gcc-libs
  rm -f "$pkgdir"/usr/lib32/lib{stdc++,gcc_s}.so

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%_*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%_*}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-fortran-git() {
  pkgdesc='Fortran front-end for GCC (git version)'
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(gcc-fortran gcc-multilib{,-git})
  conflicts=(gcc-fortran)
  replaces=(gcc-multilib-git)

  cd gcc-build
  make -C $CHOST/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C $CHOST/32/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_fincludeHEADERS
  make -C gcc DESTDIR="$pkgdir" fortran.install-{common,man,info}
  install -Dm755 gcc/f951 "$pkgdir/${_libdir}/f951"

  ln -s gfortran "$pkgdir/usr/bin/f95"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-rust-git() {
  pkgdesc="Rust frontend for GCC (git version)"
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(gcc-rust{,-git} gcc-multilib{,-git})
  conflicts=(gcc-rust)
  replaces=(gcc-multilib-git)

  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" rust.install-{common,man,info}

  install -Dm755 gcc/gccrs "$pkgdir"/usr/bin/gccrs
  install -Dm755 gcc/rust1 "$pkgdir"/"$_libdir"/rust1

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-objc-git() {
  pkgdesc='Objective-C front-end for GCC (git version)'
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(gcc-objc gcc-multilib{,-git})
  conflicts=(gcc-objc)
  replaces=(gcc-multilib-git)

  cd gcc-build
  make DESTDIR="$pkgdir" -C $CHOST/libobjc install-headers
  install -dm755 "$pkgdir/${_libdir}"
  install -m755 gcc/cc1obj{,plus} "$pkgdir/${_libdir}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_gcc-ada-git() {
  pkgdesc='Ada front-end for GCC (GNAT) (git version)'
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(gcc-ada gcc-multilib{,-git})
  conflicts=(gcc-ada)
  replaces=(gcc-multilib-git)
  options=(!emptydirs staticlibs)

  cd gcc-build/gcc
  make DESTDIR="$pkgdir" ada.install-{common,info}
  install -m755 gnat1 "$pkgdir/${_libdir}"

  cd "$srcdir"/gcc-build/$CHOST/libada
  make DESTDIR="${pkgdir}" INSTALL="install" \
    INSTALL_DATA="install -m644" install-libada

  cd "$srcdir"/gcc-build/$CHOST/32/libada
  make DESTDIR="${pkgdir}" INSTALL="install" \
    INSTALL_DATA="install -m644" install-libada

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

package_gcc-go-git() {
  pkgdesc='Go front-end for GCC (git version)'
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=("go=1.18" gcc-multilib{,-git})
  conflicts=(gcc-go go{,-git})
  replaces=(gcc-multilib-git)

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

package_lib32-gcc-libs-git() {
  pkgdesc='32-bit runtime libraries shipped by GCC (git version)'
  depends=('lib32-glibc>=2.27')
  provides=(lib32-gcc-libs libgo.so libgfortran.so libubsan.so libasan.so)
  conflicts=(lib32-gcc-libs)
  replaces=(gcc-multilib-git)
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

  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib32/libgphobos.spec

  # remove files provided by gcc-libs
  rm -rf "$pkgdir"/usr/lib

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/lib32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION"

}

package_gcc-d-git() {
  pkgdesc="D frontend for GCC (git version)"
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(gdc gcc-d{,-git} gcc-multilib{,-git})
  replaces=(gcc-multilib{,-git})
  conflicts=(gcc-d)
  options=(staticlibs !debug)

  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" d.install-{common,man,info}

  install -Dm755 gcc/gdc "$pkgdir"/usr/bin/gdc
  install -Dm755 gcc/d21 "$pkgdir"/"$_libdir"/d21

  make -C $CHOST/libphobos DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/lib/"lib{gphobos,gdruntime}.so*
  rm -f "$pkgdir/usr/lib32/"lib{gphobos,gdruntime}.so*

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_lto-dump-git() {
  pkgdesc="Dump link time optimization object files (git version)"
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(lto-dump)
  conflicts=(lto-dumb)
  replaces=(gcc-multilib-git)
  
  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" lto.install-{common,man,info}

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
package_libgccjit-git() {
  pkgdesc="Just-In-Time Compilation with GCC backend (git version)"
  depends=("gcc-git=$pkgver-$pkgrel" libisl.so)
  provides=(libgccjit)
  conflicts=(libgccjit)
  replaces=(gcc-multilib-git)

  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" jit.install-common jit.install-info

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
