# $Id$
# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=('gcc5')
pkgver=5.3.0
_pkgver=5
_islver=0.15
pkgrel=5
_snapshot=5-20160503
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.26' 'libmpc')
options=('!emptydirs')
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2)
md5sums=('907f3b860ebbaf33b3ccd3c15dddc9b1'
         '8428efbbc6f6e2810ce5c1ba73ecf98c')

#_basedir=gcc-${pkgver}
_basedir=gcc-${_snapshot}

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

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
  $(ls "$pkgdir"/usr/lib/gcc/$CHOST/lib* &> /dev/null) && mv "$pkgdir"/usr/lib/gcc/$CHOST/lib* "$pkgdir/usr/lib/gcc/$CHOST/$pkgver/"

  # Seems to be the same file for GCC 5 and 6
  rm ${pkgdir}/usr/lib/libcc1*
  
  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
