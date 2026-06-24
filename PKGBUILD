# Maintainer: Agatha Isabelle Moreira <code AT agatha PERIOD dev>

# Forked from: https://gitlab.archlinux.org/archlinux/packaging/packages/gcc.git

# Credits to the original authors, maintainers and contributors:
# Giancarlo Razzolini <grazzolini@archlinux.org>
# Frederik Schwan <freswa at archlinux dot org>
# Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Allan McRae <allan@archlinux.org>
# Daniel Kozak <kozzi11@gmail.com>

pkgname=(
  gcc-fast-optimized
  gcc-libs-fast-optimized
  libasan-fast-optimized
  libatomic-fast-optimized
  libgcc-fast-optimized
  libgccjit-fast-optimized
  libgomp-fast-optimized
  libhwasan-fast-optimized
  libitm-fast-optimized
  liblsan-fast-optimized
  libquadmath-fast-optimized
  libstdc++-fast-optimized
  libtsan-fast-optimized
  libubsan-fast-optimized
  lto-dump-fast-optimized
)
pkgver=16.1.0
pkgrel=1
pkgdesc='The GNU Compiler Collection optimized with -O3 and local cpu tuning'
arch=(x86_64)
license=(
  'GPL-3.0-or-later WITH GCC-exception-3.1'
  GFDL-1.3-or-later
)
url='https://gcc.gnu.org'
bugurl='https://todo.sr.ht/~devlavender/arch-aur-contribs'
makedepends=(
  binutils
  doxygen
  libisl
  libmpc
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
options=(
  !emptydirs
  !lto
)
pkgmaj="$(echo "${pkgver}"|cut -d'.' -f1)"
_libdir=usr/lib/gcc/$CHOST/${pkgmaj}
source=("https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz"
	"https://ftp.gnu.org/gnu/gcc/gcc-${pkgver}/gcc-${pkgver}.tar.xz.sig"
        c89
	c99
)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # foutrelis@archlinux.org
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62 # Jakub Jelinek <jakub@redhat.com>
)

sha256sums=('50efb4d94c3397aff3b0d61a5abd748b4dd31d9d3f2ab7be05b171d36a510f79'
	    '33a851c045ea2ef6f580d82b2abfb1dc75d8b270727800028ca5f40c3b4a4246'
            '7b09ec947f90b98315397af675369a1e3dfc527fa70013062e6e85c4be0275ab'
            '44ea973558842f3f4bd666bdaf6e810fd7b7c7bd36b5cc4c69f93d2cd0124fc7'
)

prepare() {
  [[ ! -d gcc ]] && ln -s gcc-${pkgver/+/-} gcc
  cd gcc

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

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
      --with-bugurl="${bugurl}" \
      --with-gcc-major-version-only
      --with-linker-hash-style=gnu
      --with-system-zlib
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
      --disable-multilib
      --enable-plugin
      --enable-shared
      --enable-threads=posix
      --disable-fixincludes
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-werror
      --with-build-config='bootstrap-native bootstrap-lto bootstrap-O3'
  )

  cd gcc-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  ../gcc/configure \
    --enable-languages=c,c++,lto \
    --enable-bootstrap \
    "${_confflags[@]:?_confflags unset}"

  echo "MAKEFLAGS=${MAKEFLAGS}"
  sleep 1
  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
  make -O STAGE1_CFLAGS="-O2" \
        BOOT_CFLAGS="$CFLAGS -O3 -march=native -mtune=native -fno-semantic-interposition" \
        BOOT_LDFLAGS="$LDFLAGS -Wl,-O1" \
        LDFLAGS_FOR_TARGET="$LDFLAGS" \
        profiledbootstrap

  # make documentation
  make -O -C $CHOST/libstdc++-v3/doc doc-man-doxygen

  # Build libgccjit separately, to avoid building all compilers with --enable-host-shared
  # which brings a performance penalty
  cd "$srcdir"/libgccjit-build

  ../gcc/configure \
    --enable-languages=jit \
    --disable-bootstrap \
    --enable-host-shared \
    "${_confflags[@]:?_confflags unset}"

  make -O all-gcc

  cp -a gcc/libgccjit.so* ../gcc-build/gcc/
}

check() {
  cd gcc-build

  # do not abort on error as some are "expected"
  make -O -k check || true
  "$srcdir/gcc/contrib/test_summary"
}

_install_runtime_library_exception() {
  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION"
}

package_gcc-fast-optimized() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends optimized with -O3 and local tuning"
  depends=(
    "libasan-fast-optimized=$pkgver-$pkgrel"
    "libgcc-fast-optimized=$pkgver-$pkgrel"
    "libhwasan-fast-optimized=$pkgver-$pkgrel"
    "liblsan-fast-optimized=$pkgver-$pkgrel"
    "libstdc++-fast-optimized=$pkgver-$pkgrel"
    "libtsan-fast-optimized=$pkgver-$pkgrel"
    "libubsan-fast-optimized=$pkgver-$pkgrel"
    'binutils>=2.28'
    'glibc>=2.27'
    gmp
    libisl.so
    libmpc
    mpfr
    zlib
    zstd
  )
  optdepends=(
  )
  provides=(
    gcc
  )
  replaces=(
    gcc
  )
  conflicts=(gcc)
  options=(
    !emptydirs
    staticlibs
  )

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper
  
  install -m755 -t "$pkgdir/usr/bin/" gcc/gcov{,-tool}
  install -m755 -t "$pkgdir/$_libdir/" gcc/{cc1,cc1plus,collect2,lto1}

  make -C $CHOST/libgcc DESTDIR="$pkgdir" install

  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/python DESTDIR="$pkgdir" install
  make -C $CHOST/libatomic DESTDIR="$pkgdir" install

  make DESTDIR="$pkgdir" install-libcc1
  install -d "$pkgdir/usr/share/gdb/auto-load/usr/lib"
  mv "$pkgdir"/usr/lib/libstdc++.so.6.*-gdb.py \
    "$pkgdir/usr/share/gdb/auto-load/usr/lib/"
  rm "$pkgdir"/usr/lib/libstdc++.so*
  rm "$pkgdir"/usr/lib/libatomic.so*
  mv -v "$pkgdir"/usr/lib/libatomic* "$pkgdir/$_libdir/"

  make DESTDIR="$pkgdir" install-fixincludes
  make -C gcc DESTDIR="$pkgdir" install-mkheaders

  make -C lto-plugin DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/usr/lib/bfd-plugins/
  ln -s /$_libdir/liblto_plugin.so \
    "$pkgdir/usr/lib/bfd-plugins/"

  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -C $CHOST/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR="$pkgdir" install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/hwasan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/tsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/lsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS

  make -C gcc DESTDIR="$pkgdir" install-man install-info

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc "$pkgdir"/usr/bin/cc

  # create cc-rs compatible symlinks
  # https://github.com/rust-lang/cc-rs/blob/1.0.73/src/lib.rs#L2578-L2581
  for binary in {c++,g++,gcc,gcc-ar,gcc-nm,gcc-ranlib}; do
    ln -s "/usr/bin/$binary" "$pkgdir/usr/bin/$CARCH-linux-gnu-$binary"
  done

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99"

  # install the libstdc++ man pages
  make -C $CHOST/libstdc++-v3/doc DESTDIR="$pkgdir" doc-install-man

  # remove files provided by lib32-gcc-libs and libgcc
  rm -f "$pkgdir"/usr/lib/libgcc_s{,_asneeded}.so*

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"

  _install_runtime_library_exception
}

package_gcc-libs-fast-optimized() {
  pkgdesc='Runtime libraries shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libasan-fast-optimized
    libatomic-fast-optimized
    libgcc-fast-optimized
    libgomp-fast-optimized
    libhwasan-fast-optimized
    liblsan-fast-optimized
    libquadmath-fast-optimized
    libstdc++-fast-optimized
    libtsan-fast-optimized
    libubsan-fast-optimized
  )
  provides=(
    gcc-libs
  )
  replaces=(
    gcc-libs
  )
  conflicts=(gcc-libs)
}

package_libasan-fast-optimized(){
  pkgdesc='Address Sanitizer runtime library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
    libstdc++-fast-optimized
  )
  provides=(
    libasan.so
    libasan
  )
  replaces=(
    libasan
  )
  conflicts=(libasan)
  cd gcc-build

  make -C $CHOST/libsanitizer/asan DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES

  _install_runtime_library_exception
}

package_libatomic-fast-optimized(){
  pkgdesc='GNU Atomic library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
  )
  provides=(
    libatomic.so
    libatomic
  )
  replaces=(
    libatomic
  )
  conflicts=(libatomic)
  cd gcc-build

  make -C $CHOST/libatomic DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES

  _install_runtime_library_exception
}

package_libgcc-fast-optimized(){
  pkgdesc='Low-level runtime library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
  )
  provides=(
    libgcc_s.so
    libgcc
  )
  replaces=(
    libgcc
  )
  conflicts=(libgcc)

  cd gcc-build
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/libgcc_eh.a"
  mv -v "$pkgdir"/usr/lib/libgcc_s{,_asneeded}.so "$pkgdir/$_libdir/"

  _install_runtime_library_exception
}

package_libgccjit-fast-optimized(){
  pkgdesc="Just-In-Time Compilation with GCC backend optimized with -O3 and local cpu tuning"
  depends=(
    "gcc-fast-optimized=$pkgver-$pkgrel"
    'glibc>=2.27'
    gmp
    libisl.so
    libmpc
    mpfr
    zlib
    zstd
  )
  provides=(
    libgccjit.so
    libgccjit
  )
  replaces=(
    libgccjit
  )
  conflicts=(libgccjit)

  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" jit.install-common jit.install-info

  _install_runtime_library_exception
}

package_libgomp-fast-optimized(){
  pkgdesc='OpenMP library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
  )
  provides=(
    libgomp.so
    libgomp
  )
  replaces=(
    libgomp
  )
  conflicts=(libgomp)

  cd gcc-build

  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-info

  _install_runtime_library_exception
}

package_libhwasan-fast-optimized(){
  pkgdesc='Hardware-assisted Address Sanitizer runtime library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
    libstdc++-fast-optimized
  )
  provides=(
    libhwasan.so
    libhwasan
  )
  replaces=(
    libhwasan
  )
  conflicts=(libhwasan)

  cd gcc-build

  make -C $CHOST/libsanitizer/hwasan DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES

  _install_runtime_library_exception
}

package_libitm-fast-optimized(){
  pkgdesc='GNU Transactional Memory library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
  )
  provides=(
    libitm.so
    libitm
  )
  replaces=(
    libitm
  )
  conflicts=(libitm)

  cd gcc-build

  make -C $CHOST/libitm DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  make -C $CHOST/libitm DESTDIR="$pkgdir" install-info

  _install_runtime_library_exception
}

package_liblsan-fast-optimized(){
  pkgdesc='Leak Sanitizer runtime library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
    libstdc++-fast-optimized
  )
  provides=(
    liblsan.so
    liblsan
  )
  replaces=(
    liblsan
  )
  conflicts=(liblsan)

  cd gcc-build

  make -C $CHOST/libsanitizer/lsan DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES

  _install_runtime_library_exception
}


package_libquadmath-fast-optimized() {
  pkgdesc='GCC __float128 library optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
  )
  provides=(
    libquadmath.so
    libquadmath
  )
  replaces=(
    libquadmath
  )
  conflicts=(libquadmath)

  cd gcc-build

  make -C $CHOST/libquadmath DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  make -C $CHOST/libquadmath DESTDIR="$pkgdir" install-info

  _install_runtime_library_exception
}

package_libstdc++-fast-optimized() {
  pkgdesc='C++ runtime libraries shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
  )
  provides=(
    libstdc++.so
    libstdc++
  )
  replaces=(
    libstdc++
  )
  conflicts=(libstdc++)

  cd gcc-build
  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES
  make -C $CHOST/libstdc++-v3/po DESTDIR="$pkgdir" install

  _install_runtime_library_exception
}

package_libtsan-fast-optimized() {
  pkgdesc='Thread Sanitizer runtime library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
    libstdc++-fast-optimized
  )
  provides=(
    libtsan.so
    libtsan
  )
  replaces=(
    libtsan
  )
  conflicts=(libtsan)

  cd gcc-build

  make -C $CHOST/libsanitizer/tsan DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES

  _install_runtime_library_exception
}

package_libubsan-fast-optimized() {
  pkgdesc='Undefined Behavior Sanitizer runtime library shipped by GCC optimized with -O3 and local cpu tuning'
  depends=(
    'glibc>=2.27'
    libgcc-fast-optimized
    libstdc++-fast-optimized
  )
  provides=(
    libubsan.so
    libubsan
  )
  replaces=(
    libubsan
  )
  conflicts=(libubsan)

  cd gcc-build

  make -C $CHOST/libsanitizer/ubsan DESTDIR="$pkgdir" install-toolexeclibLTLIBRARIES

  _install_runtime_library_exception
}

package_lto-dump-fast-optimized() {
  pkgdesc="Dump link time optimization object files optimized with -O3 and local cpu tuning"
  depends=(
    "gcc-fast-optimized=$pkgver-$pkgrel"
    'glibc>=2.27'
    gmp
    libisl.so
    libmpc
    mpfr
    zlib
    zstd
  )
  provides=(
    lto-dump
  )
  replaces=(
    lto-dump
  )
  conflicts=(lto-dump)
  cd gcc-build
  make -C gcc DESTDIR="$pkgdir" lto.install-{common,man,info}

  _install_runtime_library_exception
}
