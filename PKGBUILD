# $Id$
# Maintainer: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=('gcc49')
_pkgver=4.9
_pkgver_minor=3
pkgver=${_pkgver}.${_pkgver_minor}
_islver=0.12.2
_cloogver=0.18.1
pkgrel=1
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
        "gcc-4.9-fix-build-with-gcc-6.patch")
md5sums=('6f831b4d251872736e8e9cc09746f327'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252'
         '91f27a8002df38cf2ca971ca80feb9d7')

_basedir=gcc-${pkgver}
_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl/cloog for in-tree builds
  ln -s ../isl-${_islver} isl
  ln -s ../cloog-${_cloogver} cloog

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in
  
  # fix build with GCC 6
  patch -p1 < "${srcdir}/gcc-4.9-fix-build-with-gcc-6.patch"

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
