# Maintainer: Dimitrios "silentz0r" Misdanitis <d.misdanitis@gmail.com>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

# NOTE: GCC 4.5 is out of date, the following links explain more:
#
# https://github.com/autc04/Retro68/commit/9976339d2224afb901901c6cdc4e3f276e20067b
# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60961
# https://dev.openwrt.org/ticket/13039

pkgname='gcc45-multilib'
pkgver=4.5.4
pkgrel=1
_libstdcppmanver=4.5.2		# Note: check source directory name when updating this
pkgdesc="The GNU Compiler Collection for multilib (4.5.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.21' 'libmpc' 'cloog' 'elfutils' 'dejagnu' 'glibc>=2.11.1-2' 'lib32-glibc>=2.12.1')
conflicts=('gcc45') # Package from AUR
provides=('gcc45')
options=('!libtool' '!buildflags' '!emptydirs' 'staticlibs')
source=(
  ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++,fortran}-${pkgver}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-api-${_libstdcppmanver}.man.tar.bz2
	gcc_pure64.patch
	gcc-hash-style-both.patch
  texinfo_5_fix.patch)
md5sums=('ca62e442629a9a7710f5d797bf1b521c'
         '630c5002dee4937339cb911c28d1b736'
         'bff4035b06d65e5a8dd141a4b8041b61'
         '2776eab5ebb7f9cc62dd2199a3a24382'
         '22cec272f9cc2801d3cd348feaca888b'
         '6fd395bacbd7b6e47c7b74854b478363'
         '2e9885744042350ff9cd471c6e36d913')

prepare() {

  cd ${srcdir}/gcc-${pkgver}

  # "Add" ppl-0.11 compatibility
  sed -i "/ppl_minor_version=/s#10#11#" configure

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/gcc_pure64.patch
  fi
  patch -Np0 -i ${srcdir}/gcc-hash-style-both.patch
  patch -Np1 -i ${srcdir}/texinfo_5_fix.patch

  echo ${pkgver} > gcc/BASE-VER
}

build() {

  cd ${srcdir}
  rm -rf gcc-build
  mkdir gcc-build
  cd gcc-build
  ${srcdir}/gcc-${pkgver}/configure \
      --prefix=/usr \
      --enable-languages=c,c++,fortran \
      --enable-shared \
      --enable-threads=posix \
      --enable-__cxa_atexit \
      --enable-clocale=gnu \
      --enable-gnu-unique-object \
      --enable-lto --enable-plugin \
      --enable-gold --with-plugin-ld=ld.gold \
      --enable-multilib \
      --disable-libstdcxx-pch \
      --with-system-zlib \
      --with-ppl \
      --with-cloog \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --disable-libunwind-exceptions \
      --enable-linker-build-id \
      --enable-cloog-backend=isl \
      --enable-ld=default \
      --enable-checking=release \
      --disable-werror \
      --disable-libgomp \
      --program-suffix=-${pkgver} \
      --enable-version-specific-runtime-libs \
      MAKEINFO=missing
  make

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  # ulimit -s 32768

  # do not abort on error as some are "expected"
  # make -k check || true
  # ${_basedir}/contrib/test_summary
}

package()
{
  cd ${srcdir}/gcc-build

  make -j1 DESTDIR=${pkgdir} install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/

  install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
