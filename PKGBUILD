# Maintainer: Felix Schindler <felix at schindlerfamily dot de>
# Contributor: Tianjiao Yin <ytj000(at)gmail(dot)(see)(oh)(em)>
#              Allan McRae <allan@archlinux.org>
#
# This PKGBUILD is maintained at https://github.com/ftalbrecht/aur
# in the gcc46 branch

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=gcc46
_ver=4.6
pkgver=4.6.4
pkgrel=4
pkgdesc="The GNU Compiler Collection (4.6.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org"
provides=('gcc-4.6')
depends=('glibc' 'binutils' 'gmp' 'mpfr' 'libmpc' 'ppl' 'isl15' 'cloog' 'elfutils')
makedepends=('flex' 'bison' 'aria2')
# makedepends=('flex' 'bison' 'aria2' 'dejagnu') # For test
options=('staticlibs' '!libtool' '!emptydirs')

_mirror="ftp://ftp.lip6.fr/pub/gcc"
source=(gcc-hash-style-both.patch
	gcc_pure64.patch
	${_mirror}/releases/gcc-4.6.4/gcc-${pkgver}.tar.bz2
	)

md5sums=('4df25b623799b148a0703eaeec8fdf3f'
         '00b105ff3bc237381169d476c7f50cfb'
         'b407a3d1480c11667f293bfb1f17d1a4')

if [ -n "${_snapshot}" ]; then
  _basedir=gcc-${_snapshot}
else
  _basedir=gcc-${pkgver}
fi

build() {
  cd ${srcdir}/${_basedir}

  #"Add" ppl-0.11 compatibility
  sed -i "/ppl_minor_version=/s#10#11#" configure

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/gcc_pure64.patch
  fi
  patch -Np0 -i ${srcdir}/gcc-hash-style-both.patch

  # Doesn't like FORTIFY_SOURCE
  CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
  export CPPFLAGS

  # Doesn't like -fstack-protector-strong
  CFLAGS=${CFLAGS//-fstack-protector-strong/-fstack-protector}
  export CFLAGS
  CXXFLAGS=${CXXFLAGS//-fstack-protector-strong/-fstack-protector}
  export CXXFLAGS

  echo ${pkgver} > gcc/BASE-VER

  cd ${srcdir}
  mkdir -p gcc-build && cd gcc-build
  ${srcdir}/${_basedir}/configure --prefix=/usr \
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
      --program-suffix=-${_ver} --enable-version-specific-runtime-libs \
      --enable-checking=release

      # --with-cloog --with-cloog-include=/usr/include/cloog-ppl \
  make
}

_check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  # do not abort on error as some are "expected"

  ulimit -s 32768
  make -k -j3 check || true
  ${_basedir}/contrib/test_summary
}


package() {
  cd ${srcdir}/gcc-build

  make -j1 DESTDIR=${pkgdir} install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/

  # Move potentially conflicting stuff to version specific subdirectory
  $(ls "$pkgdir"/usr/lib/gcc/$CHOST/lib* 2&> /dev/null) && mv "$pkgdir"/usr/lib/gcc/$CHOST/lib* "$pkgdir/usr/lib/gcc/$CHOST/$pkgver/"

  install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}

