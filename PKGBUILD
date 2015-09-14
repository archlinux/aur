# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Kevin Mihelich <kevin@archlinuxarm.org>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

_target="arm-linux-gnueabihf"
pkgname="${_target}-gcc"
pkgver=5.2.0
_pkgver=5
_islver=0.14.1
pkgrel=2
#_snapshot=5-20150623
pkgdesc="The GNU Compiler Collection (${_target})"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=("${_target}-binutils>=2.25" "${_target}-glibc" 'libmpc' 'elfutils' 'zlib')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' '!distcc' '!strip')
conflicts=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
replaces=("${_target}-gcc-stage1" "${_target}-gcc-stage2")
provides=("${_target}-gcc-stage1=${pkgver}" "${_target}-gcc-stage2=${pkgver}")
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
        http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2
        pr66035.patch)
md5sums=('a51bcfeb3da7dd4c623e27207ed43467'
         '118d1a379abf7606a3334c98a8411c79'
         '5b980076cd5fcbc3aff6014f306282dd')

if [ -n "${_snapshot}" ]; then
  _basedir=gcc-${_snapshot}
else
  _basedir=gcc-${pkgver}
fi

prepare() {
  cd ${srcdir}/${_basedir}

  # link isl for in-tree build
  ln -s ../isl-${_islver} isl

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=66035
  patch -p1 -i ${srcdir}/pr66035.patch

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --program-prefix=${_target}- \
      --with-local-prefix=/usr/${_target} \
      --with-sysroot=/usr/${_target} \
      --with-as=/usr/bin/${_target}-as \
      --with-ld=/usr/bin/${_target}-ld \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --with-arch=armv6 --with-float=hard --with-fpu=vfp \
      --target=${_target} --host=${CHOST} --build=${CHOST} \
      --disable-nls \
      --enable-languages=c,c++ \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --with-isl --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu --enable-gnu-indirect-function \
      --disable-multilib --disable-werror \
      --enable-checking=release \
      --with-default-libstdcxx-abi=gcc4-compatible

  #--enable-languages=c,c++,fortran,go,lto,objc,obj-c++ \

  make
}

package() {
  cd ${srcdir}/gcc-build

  make DESTDIR=${pkgdir} install-gcc install-target-libgcc \
    install-target-libstdc++-v3

  rm -rf ${pkgdir}/usr/share

  # strip it manually
  strip ${pkgdir}/usr/bin/* 2>/dev/null || true
  find ${pkgdir}/usr/lib -type f -exec /usr/bin/${_target}-strip \
    --strip-unneeded {} \; 2>/dev/null || true
}
