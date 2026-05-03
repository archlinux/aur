# Maintainer: Bink
# Contributor: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Frederik Schwan <freswa at archlinux dot org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Daniel Kozak <kozzi11@gmail.com>

pkgname=(gcc15 gcc15-libs gcc15-fortran)
pkgver=15.2.1+r604+g0b99615a8aef
_commit=0b99615a8aef011cff76c6caa8c09434f46598b3
pkgrel=1
pkgdesc='The GNU Compiler Collection (15.x.x)'
arch=(x86_64)
license=(
  'GPL-3.0-or-later WITH GCC-exception-3.1'
  GFDL-1.3-or-later
)
url='https://gcc.gnu.org'
makedepends=(
  binutils
  doxygen
  git
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
options=(!emptydirs !lto)
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}


source=("gcc15::git+https://github.com/gcc-mirror/gcc.git#commit=${_commit}"
        c89 c99
)
sha256sums=('fda170be6da777107c74ad322d51a508edf448b86ce8247755eb0eb1524f38b6'
            '9afb0195be5b5730f3550c46cc2a5a5f9170ce68557e5080e733f0d9a695021b'
            '332c6b7d63e36ce8a944180a5b00c931d56f13a572e917a9fe9266b0c2d8a8b5')
b2sums=('933be03bc3fb9714ae311ccef1b00a6dc77098fb8df5fc9b0245dd621284ac44601e3f8bfc259808e84283044cb7a48a3a95a258507475e6fd61ccb71f592add'
        '587ebe5c75c5abf444270f1cbd86a9199e2fdb503bcdc3cd159190f8169a6a9b0cd0e4f3dd4ef0676d3d9912df7ab18858fae8c8ab8a1b0df37a449e1ed1edd1'
        'de8caebaeddda549c7680fde933378cbae23de7fe7e90ba56fa2b8715edc32a3b372ea6be80aad83a74de70da7e41c8f79e48061546f69cdbac40f4287ca3937')

pkgver() {
  cd gcc15
  echo "$(cat gcc/BASE-VER)+$(git describe --abbrev=12 --tags | sed 's/[^-]*-[^-]*-//;s/[^-]*-/r&/;s/-/+/g;s/_/./')"
}

prepare() {
  cd gcc15

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64
  sed -i '/lp64=/s/lib64/lib/' gcc/config/aarch64/t-aarch64-linux
  mkdir -p "$srcdir/gcc-build"
}

build() {
  local _confflags=(
      --prefix=/usr
      --libdir=/usr/lib
      --libexecdir=/usr/lib
      --mandir=/usr/share/man
      --infodir=/usr/share/info
      --with-bugurl=https://gitlab.archlinux.org/archlinux/packaging/packages/gcc15/-/issues
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
      --enable-linker-build-id
      --enable-lto
      --disable-multilib
      --enable-plugin
      --enable-shared
      --enable-threads=posix
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-werror
      --program-suffix=-15
      --enable-version-specific-runtime-libs
  )

  cd gcc-build

  # Credits @allanmcrae
  # https://github.com/allanmcrae/toolchain/blob/f18604d70c5933c31b51a320978711e4e6791cf1/gcc/PKGBUILD
  # TODO: properly deal with the build issues resulting from this
  CFLAGS=${CFLAGS/-Werror=format-security/}
  CXXFLAGS=${CXXFLAGS/-Werror=format-security/}

  "$srcdir/gcc15/configure" \
    --enable-languages=c,c++,fortran \
    --enable-bootstrap \
    "${_confflags[@]:?_confflags unset}"

  # see https://bugs.archlinux.org/task/71777 for rationale re *FLAGS handling
  make -O STAGE1_CFLAGS="-O2" \
          BOOT_CFLAGS="$CFLAGS" \
          BOOT_LDFLAGS="$LDFLAGS" \
          LDFLAGS_FOR_TARGET="$LDFLAGS" \
          bootstrap \
          -j$(nproc)

  # make documentation
  make -O -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

# Disabled to reduce build time.
# check() {
#  cd gcc-build
#
#  # do not abort on error as some are "expected"
#  make -O -k check || true
#  "$srcdir/gcc15/contrib/test_summary"
# }

package_gcc15-libs() {
  pkgdesc='Runtime libraries shipped by GCC (15.x.x)'
  depends=('glibc>=2.27')
  options=(!emptydirs !strip)

  cd gcc-build
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  mv "${pkgdir}/${_libdir}"/../lib/* "${pkgdir}/${_libdir}"
  rmdir "${pkgdir}/${_libdir}"/../lib
  rm -f "$pkgdir/$_libdir/libgcc_eh.a"

  for lib in libasan.so \
             libatomic.so \
             libgfortran.so \
             libgomp.so \
             libitm.so \
             liblsan.so \
             libquadmath.so \
             libstdc++.so \
             libtsan.so \
             libubsan.so; do
    ln -s /usr/lib/$lib "$pkgdir/$_libdir/$lib"
  done

  make -C $CHOST/libstdc++-v3/po DESTDIR="$pkgdir" install

  rm -rf "$pkgdir"/$_libdir/include/d/
  rm -f "$pkgdir"/usr/lib/libgphobos.spec

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc15/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/gcc15-libs/RUNTIME.LIBRARY.EXCEPTION"

  # remove conflicting files
  rm -rf "${pkgdir}"/usr/share/locale
}

package_gcc15() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (15.x.x)"
  depends=("gcc15-libs" 'binutils>=2.28' libmpc zstd libisl.so)
  options=(!emptydirs staticlibs)

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "$pkgdir/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1,gcov{,-tool}}

  make -C $CHOST/libgcc DESTDIR="$pkgdir" install
  rm -f "${pkgdir}/${_libdir}"/../lib/libgcc_s.so*
  rmdir "${pkgdir}/${_libdir}"/../lib

  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/python DESTDIR="$pkgdir" install
  rm -f "${pkgdir}/${_libdir}"/libstdc++.so*

  make DESTDIR="$pkgdir" install-fixincludes
  make -C gcc DESTDIR="$pkgdir" install-mkheaders

  make -C lto-plugin DESTDIR="$pkgdir" install
  install -dm755 "$pkgdir"/${_libdir}/bfd-plugins/
  ln -s /${_libdir}/liblto_plugin.so \
    "$pkgdir/${_libdir}/bfd-plugins/"

  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_{libsubinclude,toolexeclib}HEADERS
  make -C $CHOST/libitm DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR="$pkgdir" install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR="$pkgdir" install-nodist_{saninclude,toolexeclib}HEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/tsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/lsan DESTDIR="$pkgdir" install-nodist_toolexeclibHEADERS

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc-15 "$pkgdir"/usr/bin/cc-15

  # create cc-rs compatible symlinks
  # https://github.com/rust-lang/cc-rs/blob/1.0.73/src/lib.rs#L2578-L2581
  for binary in {c++,g++,gcc,gcc-ar,gcc-nm,gcc-ranlib}; do
    ln -s /usr/bin/${binary} "${pkgdir}"/usr/bin/x86_64-linux-gnu-${binary}-15
  done

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89-15"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99-15"

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc15-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # remove conflicting files
  rm -rf "${pkgdir}"/usr/share/locale
}

package_gcc15-fortran() {
  pkgdesc='Fortran front-end for GCC (15.x.x)'
  depends=("gcc15" libisl.so)

  cd gcc-build
  make -C $CHOST/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_fincludeHEADERS
  make -C gcc DESTDIR="$pkgdir" fortran.install-common
  install -Dm755 gcc/f951 "$pkgdir/${_libdir}/f951"

  ln -s gfortran-15 "$pkgdir/usr/bin/f95-15"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc15-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
