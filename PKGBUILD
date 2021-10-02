# Maintainer: Jonathon Fernyhough <jonathon + m2x + dev>
# Contributor:  Konstantin Gizdov <arch at kge dot pw>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Daniel Kozak <kozzi11@gmail.com>

pkgbase=gcc9
pkgname=(${pkgbase} ${pkgbase}-libs ${pkgbase}-fortran)
pkgver=9.4.0
_majorver=${pkgver:0:1}
_islver=0.24
pkgrel=1
pkgdesc='The GNU Compiler Collection'
arch=(x86_64)
license=(GPL LGPL FDL custom)
url='https://gcc.gnu.org'
makedepends=(binutils libmpc doxygen python git)
checkdepends=(dejagnu inetutils)
options=(!emptydirs)
_libdir=usr/lib/gcc/$CHOST/${pkgver%%+*}
# _commit=6957d3e4eef1f4243eb23ff62aea06139ef4415a
# source=(git://gcc.gnu.org/git/gcc.git#commit=$_commit
source=(https://ftp.gnu.org/gnu/gcc/gcc-$pkgver/gcc-$pkgver.tar.xz{,.sig}
        https://mirror.sobukus.de/files/src/isl/isl-${_islver}.tar.xz
        c89 c99
        fs64270.patch)
validpgpkeys=(F3691687D867B81B51CE07D9BBE43771487328A9  # bpiotrowski@archlinux.org
              86CFFCA918CF3AF47147588051E8B148A9999C34  # evangelos@foutrelis.com
              13975A70E63C361C73AE69EF6EEB81F8981C74C7  # richard.guenther@gmail.com
              D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62) # Jakub Jelinek <jakub@redhat.com>
sha512sums=('dfd3500bf21784b8351a522d53463cf362ede66b0bc302edf350bb44e94418497a8b4b797b6af8ca9b2eeb746b3b115d9c3698381b989546e9151b4496415624'
            'SKIP'
            'ff6bdcff839e1cd473f2a0c1e4dd4a3612ec6fee4544ccbc62b530a7248db2cf93b4b99bf493a86ddf2aba00e768927265d5d411f92061ea85fd7929073428e8'
            '25f0e186388075e25c80c2322865e948f22678f6769886d30c09204eb0e7efd6653170b62e749ece674d0814843609be75a096fd54bb65a87fa4037cf2889d03'
            'a0589368eb84611e2fd7397c619b7f13700bfac8018a45c35bd1c0c3d59a2782609cb9d8d090696586ea721c6d93dca6f7f6c689ac729341ee62e035b1d5af14'
            '38a0fedeac3eebe4a6a957792ba520225cf42663c96a171cd168fdb6c91ffa9a56b80351f8238c5d03b78d3ae2a6539a54481fe4848b4a395e2c87f2ff7adc08')

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

  # Turn off SSP for nostdlib|nodefaultlibs|ffreestanding
  # https://bugs.archlinux.org/task/64270
  patch -p1 -i "$srcdir/fs64270.patch"

  mkdir -p "$srcdir/gcc-build"
}

build() {
  cd gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  # Force this for now, doesn't seem to be picked up via patch from https://bugs.archlinux.org/task/70701
  CFLAGS+=" -Wno-format -Wno-format-security"
  CXXFLAGS+=" -Wno-format -Wno-format-security"

  "$srcdir/gcc/configure" --prefix=/usr \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-pkgversion="Arch Linux $pkgver-$pkgrel" \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran,lto \
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
      --disable-werror \
      --enable-checking=release \
      --enable-default-pie \
      --enable-default-ssp \
      --enable-cet=auto \
      --program-suffix=-${_majorver} \
      --enable-version-specific-runtime-libs \
      --disable-multilib
  make

  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

check() {
  cd gcc-build

  # disable libphobos test to avoid segfaults and other unfunny ways to waste my time  
  sed -i '/maybe-check-target-libphobos \\/d' Makefile 

  # do not abort on error as some are "expected"
  make -k check || true
  "$srcdir/gcc/contrib/test_summary"
}

package_gcc9-libs() {
  pkgdesc='Runtime libraries shipped by GCC (9.x.x)'
  depends=('glibc>=2.27')
  options+=(!strip)
  provides=(libgfortran.so libubsan.so libasan.so libtsan.so liblsan.so)

  cd gcc-build
  make -C $CHOST/libgcc DESTDIR="$pkgdir" install-shared
  mv "${pkgdir}/${_libdir}"/../lib/* "${pkgdir}/${_libdir}"
  rmdir "${pkgdir}/${_libdir}"/../lib
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

  # Install Runtime Library Exception
  install -Dm644 "$srcdir/gcc/COPYING.RUNTIME" \
    "$pkgdir/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION"

  # remove conflicting files
  rm -rf "${pkgdir}"/usr/share/locale
}

package_gcc9() {
  pkgdesc="The GNU Compiler Collection - C and C++ frontends (9.x.x)"
  depends=("${pkgbase}-libs=$pkgver-$pkgrel" 'binutils>=2.28' libmpc)
  options+=(staticlibs)

  cd gcc-build

  make -C gcc DESTDIR="$pkgdir" install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 -t "$pkgdir/${_libdir}/" gcc/{cc1,cc1plus,collect2,lto1,gcov{,-tool}}

  make -C $CHOST/libgcc DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/${_libdir}"/../lib

  make -C $CHOST/libstdc++-v3/src DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/include DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR="$pkgdir" install
  make -C $CHOST/libstdc++-v3/python DESTDIR="$pkgdir" install
  rm -f "${pkgdir}/${_libdir}"/libstdc++.so*

  make DESTDIR="$pkgdir" install-fixincludes
  make -C gcc DESTDIR="$pkgdir" install-mkheaders

  make -C lto-plugin DESTDIR="$pkgdir" install

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
  ln -s gcc-${_majorver} "$pkgdir"/usr/bin/cc-${_majorver}

  # POSIX conformance launcher scripts for c89 and c99
  install -Dm755 "$srcdir/c89" "$pkgdir/usr/bin/c89-${_majorver}"
  install -Dm755 "$srcdir/c99" "$pkgdir/usr/bin/c99-${_majorver}"

  # byte-compile python libraries
  python -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"
  python -O -m compileall "$pkgdir/usr/share/gcc-${pkgver%%+*}/"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"

  # Remove conflicting files
  rm -rf "$pkgdir"/usr/share/locale
}

package_gcc9-fortran() {
  pkgdesc='Fortran front-end for GCC (9.x.x)'
  depends=("${pkgbase}=$pkgver-$pkgrel")

  cd gcc-build
  make -C $CHOST/libgfortran DESTDIR="$pkgdir" install-cafexeclibLTLIBRARIES \
    install-{toolexeclibDATA,nodist_fincludeHEADERS,gfor_cHEADERS}
  make -C $CHOST/libgomp DESTDIR="$pkgdir" install-nodist_fincludeHEADERS
  make -C gcc DESTDIR="$pkgdir" fortran.install-common
  install -Dm755 gcc/f951 "$pkgdir/${_libdir}/f951"

  ln -s gfortran-${_majorver} "$pkgdir/usr/bin/f95-${_majorver}"

  # Install Runtime Library Exception
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  ln -s /usr/share/licenses/${pkgbase}-libs/RUNTIME.LIBRARY.EXCEPTION \
    "$pkgdir/usr/share/licenses/$pkgname/"
}
