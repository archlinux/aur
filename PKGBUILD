# $Id$
# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=('gcc49')
_pkgver=4.9
_pkgver_minor=4
pkgver=${_pkgver}.${_pkgver_minor}
_islver=0.12.2
_cloogver=0.18.1
pkgrel=3
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.25' 'libmpc' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=("ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        "ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
        "ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-${_cloogver}.tar.gz"
        "0000-gcc-4.9.ucontext.patch"
        "0001-gcc-4.9-SIGSEGV.patch"
        "0002-gcc-4.9-__res_state.patch"
        "0003-gcc-4.9-ustate.patch"
        "0004-glibc-2.31-libsanitizer.patch")
md5sums=('87c24a4090c1577ba817ec6882602491'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252'
         '4a0dc704f1d92ceb4dd8608811241cec'
         'e787a03f0c38434490515a5823eca0b8'
         'c64d1e20274ff4fbfacdd11bef2e1273'
         'b27134678242f358c9b81cd73a1bcba1'
         '931ee06584a47f3bdb5ea57fa2d5f76f')

_basedir=gcc-${pkgver}
_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl/cloog for in-tree builds
  ln -s ../isl-${_islver} isl
  ln -s ../cloog-${_cloogver} cloog

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  
  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure
  
  # fix build with glibc 2.26
  #diff -pNau5 libsanitizer/sanitizer_common/sanitizer_linux.h{.orig,} > '../0000-gcc-4.9.ucontext.patch'
  patch -Nbup0 -i "${srcdir}/0000-gcc-4.9.ucontext.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41921
  #diff -pNau5 libsanitizer/asan/asan_linux.cc{.orig,} > '../0001-gcc-4.9-SIGSEGV.patch'
  patch -Nbup0 -i "${srcdir}/0001-gcc-4.9-SIGSEGV.patch"
  #diff -pNau5 libsanitizer/tsan/tsan_platform_linux.cc{.orig,} > '../0002-gcc-4.9-__res_state.patch'
  patch -Nbup0 -i "${srcdir}/0002-gcc-4.9-__res_state.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41922
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')
  sed -e '/^struct ucontext_t/,/^};/ d' -i 'libsanitizer/tsan/tsan_interceptors.cc'
  if grep -e '^struct ucontext_t' 'libsanitizer/tsan/tsan_interceptors.cc'; then
    set +u
    echo 'Failed to remove ^struct ucontext_t'
    false
  fi
  
  patch -Nbup0 -i "${srcdir}/0003-gcc-4.9-ustate.patch"
  patch -p1 -i "${srcdir}/0004-glibc-2.31-libsanitizer.patch"

  mkdir -p ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}
  
  # GCC 4.9 doesn't understand -fno-plt
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}
  
  # The GCC 4.9 library is otherwise found incorrectly zhen invoking host tools
  export LD_PRELOAD=/usr/lib/libstdc++.so

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --build=${CHOST} \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --disable-multilib --disable-werror \
      --program-suffix=-${_pkgver} --enable-version-specific-runtime-libs \
      --enable-checking=release
      
# gcc-5.0 changes
#      --with-default-libstdcxx-abi=c++98    - before gcc-5.0 c++ rebuild
#      --enable-gnu-indirect-function
#      --with-isl    - cloog no longer needed

  export LD_PRELOAD=/usr/lib/libstdc++.so
  make
  
  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

package()
{
  cd ${srcdir}/gcc-build

  # The GCC 4.9 library is otherwise found incorrectly zhen invoking host tools
  export LD_PRELOAD=/usr/lib/libstdc++.so
  
  make -j1 DESTDIR=${pkgdir} install
  
  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/
  rm -rf ${pkgdir}/usr/include/
  find ${pkgdir}/ -name \*iberty\* | xargs rm
  
  # Move potentially conflicting stuff to version specific subdirectory
  $(ls "$pkgdir"/usr/lib/gcc/$CHOST/lib* &> /dev/null) && mv "$pkgdir"/usr/lib/gcc/$CHOST/lib* "$pkgdir/usr/lib/gcc/$CHOST/$pkgver/"
  
  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION

  # create symlinks
  cd ${pkgdir}/usr/bin
  rm ${CHOST}-gcc-${pkgver}
  for ii in c++ cpp g++ gcc gcc-ar gcc-nm gcc-ranlib gfortran; do
    ln -s ${ii}-${_pkgver} ${ii}-${pkgver}
    ln -s ${CHOST}-${ii}-${_pkgver} ${CHOST}-${ii}-${pkgver}
  done
  ln -s gcov-${_pkgver} gcov-${pkgver}
}
