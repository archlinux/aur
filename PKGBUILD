# $Id$
# Maintainer: Michael Strecke <michael-strecke@hotmail.de>
# Contributor: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=('gcc54')
pkgver=5.4.0
_pkgver=5
_islver=0.18
pkgrel=1
pkgdesc="The GNU Compiler Collection (5.4.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.26' 'libmpc')
options=('!emptydirs')
provides=('gcc5')
conflicts=('gcc5')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        0000-gcc-5.4.ucontext.patch
        0001-gcc-5.4-SIGSEGV.patch
        0002-gcc-5.4-__res_state.patch)
md5sums=('4c626ac2a83ef30dfb9260e6f59c2b30'
         '11436d6b205e516635b666090b94ab32'
         'd5ad288e14234f7961daf5c14eb3dc27'
         '6fb3aa8e209629efd48197cc1d3445e2'
         '206f4389209e5475faaa4538a4cc567b')

_basedir=gcc-${pkgver}

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  
  # fix build with glibc 2.26
  patch -Nbup0 -i "${srcdir}/0000-gcc-5.4.ucontext.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41921
  patch -Nbup0 -i "${srcdir}/0001-gcc-5.4-SIGSEGV.patch"
  patch -Nbup0 -i "${srcdir}/0002-gcc-5.4-__res_state.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41922
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')
  sed -e '/^struct ucontext_t/,/^};/ d' -i 'libsanitizer/tsan/tsan_interceptors.cc'
  if grep -e '^struct ucontext_t' 'libsanitizer/tsan/tsan_interceptors.cc'; then
    set +u
    echo 'Failed to remove ^struct ucontext_t'
    false
  fi

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

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

  # This option exist in default makepkg.conf while it's not supported by gcc5
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --build=${CHOST} \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix --enable-libmpx \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release \
      --program-suffix=-${_pkgver} \
      --enable-version-specific-runtime-libs
      #--enable-install-libiberty

  export LD_PRELOAD=/usr/lib/libstdc++.so
  make
}

package() {
  cd ${srcdir}/gcc-build

  make -j1 DESTDIR=${pkgdir} install
  
  # Lazy way of dealing with conflicting files...
  rm -rf ${pkgdir}/usr/share/{info,locale,man}

  # Move potentially conflicting stuff to version specific subdirectory
  [[ -d ${pkgdir}/usr/lib ]] && mv ${pkgdir}/usr/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  [[ -d ${pkgdir}/usr/lib/gcc/${CHOST}/lib/ ]] && mv ${pkgdir}/usr/lib/gcc/${CHOST}/lib/lib* ${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/
  
  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
