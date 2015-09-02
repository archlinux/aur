# Maintainer: Felix Schindler <felix at schindlerfaimly dot de>
# Contributor: Allan McRae <allan@archlinux.org>
#
# This PKGBUILD is maintained at https://github.com/ftalbrecht/aur
# in the gcc48 branch

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=gcc48
_pkgver_minor=4.8
pkgver=${_pkgver_minor}.5
pkgrel=1
pkgdesc="The GNU Compiler Collection - C and C++ frontends (4.8.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=('binutils>=2.24' 'libmpc' 'cloog')
makedepends=('binutils>=2.24' 'libmpc' 'cloog' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' 'staticlibs' '!libtool')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
md5sums=('80d2c2982a3392bb0b89673ff136e223')

_basedir=gcc-${pkgver}

_libdir="usr/lib/gcc/$CHOST/$pkgver"

build() {
  # prepare
  cd ${srcdir}/${_basedir}

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # installing libiberty headers is broken
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56780#c6
  sed -i 's#@target_header_dir@#libiberty#' libiberty/Makefile.in

  mkdir ${srcdir}/gcc-build

  # build
  cd ${srcdir}/gcc-build

  # Doesn't like FORTIFY_SOURCE
  CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
  export CPPFLAGS

  # Doesn't like -fstack-protector-strong
  CFLAGS=${CFLAGS//-fstack-protector-strong/-fstack-protector}
  export CFLAGS
  CXXFLAGS=${CXXFLAGS//-fstack-protector-strong/-fstack-protector}
  export CXXFLAGS

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  LD_PRELOAD=/usr/lib/libstdc++.so.6 ${srcdir}/${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch \
      --enable-gnu-unique-object \
      --with-ppl \
      --disable-multilib --disable-werror \
      --enable-linker-build-id \
      --enable-cloog-backend=isl \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --program-suffix=-${pkgver} --enable-version-specific-runtime-libs \
      --enable-checking=release

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
  for ii in c++ g++ gcc gcc-ar gcc-nm gcc-ranlib gfortran; do
    ln -s ${ii}-${pkgver} ${ii}-${_pkgver_minor}
    ln -s ${CHOST}-${ii}-${pkgver} ${CHOST}-${ii}-${_pkgver_minor}
  done
  ln -s gcov-${pkgver} gcov-${_pkgver_minor}
}
