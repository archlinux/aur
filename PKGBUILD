# Maintainer: Janez Žemva <janezz55@gmail.com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=(fastgcc)
pkgver=9.2.0
_majorver=${pkgver:0:1}
_islver=0.21
pkgrel=8
pkgdesc='experimental gcc supporting faster compilation'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(binutils libmpc python)
checkdepends=(inetutils)
options=(!emptydirs)
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz
        http://isl.gforge.inria.fr/isl-${_islver}.tar.xz
        c89 c99)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

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
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -Ofast/" {libiberty,gcc}/configure

  mkdir -p "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  CFLAGS="${CFLAGS} -Ofast"
  CXXFLAGS="${CXXFLAGS} -Ofast"

  "$srcdir/gcc/configure" --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --enable-languages=c,c++,lto \
      --enable-shared \
      --enable-threads=posix \
      --with-system-zlib \
      --with-isl \
      --enable-__cxa_atexit \
      --disable-libunwind-exceptions \
      --enable-clocale=gnu \
      --enable-decimal-float \
      --disable-libstdcxx-pch \
      --disable-libssp \
      --enable-gnu-unique-object \
      --enable-lto \
      --enable-plugin \
      --enable-install-libiberty \
      --with-arch=native \
      --with-cpu=native \
      --with-linker-hash-style=gnu \
      --enable-gnu-indirect-function \
      --disable-multilib \
      --disable-werror \
      --enable-checking=release \
      --disable-cet \
      --disable-ld \
      --enable-gold

  sed -i "s|-O2|-Ofast|g" Makefile

  make

  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

package_fastgcc() {
  depends=('binutils>=2.28' libmpc)
  groups=('base-devel')
  options+=(staticlibs)
  conflicts=(gcc 'gcc-libs')
  provides=(gcc 'gcc-libs')

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "$pkgdir/usr/bin/" gcc/gcov{,-tool}
  install -m755 -t "$pkgdir/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1}

  make -C $CHOST/libgcc DESTDIR="$pkgdir" install
  rm -f "$pkgdir"/usr/lib/libgcc_s.so*

  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/python DESTDIR="$pkgdir" install

  make DESTDIR="$pkgdir" install-libcc1
  install -d "$pkgdir/usr/share/gdb/auto-load/usr/lib"
  mv "$pkgdir"/usr/lib/libstdc++.so.6.*-gdb.py \
    "$pkgdir/usr/share/gdb/auto-load/usr/lib/"
  rm "$pkgdir"/usr/lib/libstdc++.so*

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

  make -C libiberty DESTDIR="$pkgdir" install
  install -m644 libiberty/pic/libiberty.a "$pkgdir/usr/lib"

  make -C gcc DESTDIR="$pkgdir" install-man install-info

  make -C libcpp DESTDIR="$pkgdir" install
  make -C gcc DESTDIR="$pkgdir" install-po

  # many packages expect this symlink
  ln -s gcc "$pkgdir"/usr/bin/cc

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99"

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # gcc-libs
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  rm -f "$pkgdir/$_libdir/libgcc_eh.a"

  for lib in libatomic \
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

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION"
}
