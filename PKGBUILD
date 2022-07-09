# Maintainer: Vladislav Nepogodin <nepogodin.vlad@gmail.com>
# Contributor: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgbase=gccrs-git
pkgname=({gccrs,gccrs-libs,lib32-gccrs-libs,gccrs-fortran,gccrs-rust}-git)
pkgver=13.0.0_r193646.g3164de6ac1b
_majorver=${pkgver%%.*}
pkgrel=1
pkgdesc='The GNU Compiler Collection with rust front-end'
arch=(x86_64)
license=(GPL3 LGPL FDL custom)
url='https://github.com/Rust-GCC/gccrs'
makedepends=(
  binutils
  doxygen
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
source=("${pkgname%-git}::git+https://github.com/Rust-GCC/gccrs.git"
        c89 c99
)
sha256sums=('SKIP'
            'de48736f6e4153f03d0a5d38ceb6c6fdb7f054e8f47ddd6af0a3dbf14f27b931'
            '2513c6d9984dd0a2058557bf00f06d8d5181734e41dcfe07be7ed86f2959622a')

pkgver() {
  cd ${pkgbase%-git}
  echo "$(cat gcc/BASE-VER)_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
  cd gccrs

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  mkdir -p "$srcdir/gccrs-build"
}

build() {
  local _confflags=(
    --prefix=/usr
    --libdir=/usr/lib
    --libexecdir=/usr/lib
    --mandir=/usr/share/man
    --infodir=/usr/share/info
    --with-bugurl=https://cachyos.org/
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
    --enable-linker-build-id
    --enable-lto
    --enable-multilib
    --enable-plugin
    --enable-shared
    --enable-threads=posix
    --disable-libssp
    --disable-libstdcxx-pch
    --disable-werror
    --with-build-config=bootstrap-lto
    --enable-link-serialization=1
  )
  cd gccrs-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir/gccrs/configure" \
    --enable-languages=c,c++,fortran,lto,rust \
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
}

check() {
  cd gccrs-build

  make -O -k check-rust || true
  "$srcdir/gccrs/contrib/test_summary"
}

package_gccrs-libs-git() {
  pkgdesc='Runtime libraries shipped by GCC (git version)'
  depends=('glibc>=2.27')
  options=(!emptydirs !strip)
  provides=("gcc-libs-git=$pkgver-$pkgrel" gcc-libs gcc-multilib{,-git} libgfortran.so
  libubsan.so libasan.so libtsan.so liblsan.so)
  conflicts=(gcc-libs{,-git})
  replaces=(gcc-multilib-git)

  cd gccrs-build
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/libgcc_eh.a"

  for lib in libatomic \
    libgfortran \
    libgomp \
    libitm \
    libquadmath \
    libsanitizer/{a,l,ub,t}san \
    libstdc++-v3/src \
    libvtv; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  done

  make -C $CHOST/libstdc++-v3/po DESTDIR="$pkgdir" install

  for lib in libgomp \
    libitm \
    libquadmath; do
    make -C $CHOST/$lib DESTDIR="$pkgdir" install-info
  done

  # remove files provided by lib32-gcc-libs
  rm -rf "$pkgdir"/usr/lib32/

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gccrs/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION"
}

package_gccrs-git() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (git version)"
  depends=("gccrs-libs-git=$pkgver-$pkgrel" "binutils>=2.28" libmpc zstd libisl.so)
  groups=(base-devel-git)
  optdepends=('lib32-gcc-libs-git: for generating code for 32-bit ABI')
  provides=(gcc{,-multilib{,-git}})
  conflicts=(gcc{,-git})
  replaces=(gcc-multilib-git)
  options=(!emptydirs staticlibs debug)

  cd gccrs-build

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
  rm "$pkgdir"/usr/share/man/man1/gfortran.1
  rm "$pkgdir"/usr/share/info/gfortran.info

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

package_gccrs-fortran-git() {
  pkgdesc='Fortran front-end for GCC (git version)'
  depends=("gccrs-git=$pkgver-$pkgrel" libisl.so)
  provides=(gcc-fortran gcc-multilib{,-git})
  conflicts=(gcc-fortran{,-git})
  replaces=(gcc-multilib-git)

  cd gccrs-build
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

package_gccrs-rust-git() {
  pkgdesc="Rust frontend for GCC"
  depends=("gccrs-git=$pkgver-$pkgrel" libisl.so)
  provides=(gcc-rust{,-git})
  conflicts=(gcc-rust)
  replaces=(gcc-rust-git)

  cd gccrs-build
  make -C gcc DESTDIR="$pkgdir" rust.install-{common,man,info}

  install -Dm755 gcc/gccrs "$pkgdir"/usr/bin/gccrs
  install -Dm755 gcc/rust1 "$pkgdir"/"$_libdir"/rust1

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}

package_lib32-gccrs-libs-git() {
  pkgdesc='32-bit runtime libraries shipped by GCC (git version)'
  depends=('lib32-glibc>=2.27')
  provides=(lib32-gcc-libs libgfortran.so libubsan.so libasan.so)
  conflicts=(lib32-gcc-libs{,-git})
  groups=(multilib-devel-git)
  options=(!emptydirs !strip)

  cd gccrs-build

  make -C $CHOST/32/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/32/libgcc_eh.a"

  for lib in libatomic \
    libgfortran \
    libgomp \
    libitm \
    libquadmath \
    libsanitizer/{a,l,ub}san \
    libstdc++-v3/src \
    libvtv; do
    make -C $CHOST/32/$lib DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  done

  # remove files provided by gcc-libs
  rm -rf "$pkgdir"/usr/lib

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gccrs/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/lib32-gcc-libs/RUNTIME.LIBRARY.EXCEPTION"
}
