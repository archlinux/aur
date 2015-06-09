# Submitter: Piotr "utak3r" Borys <piotr.borys@gmail.com>
# Maintainer: Giovanni "ItachiSan" Santini <giovannisantini93@yahoo.it>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname='gcc44-multilib'
pkgver=4.4.7
pkgrel=3
_libstdcppmanver=4.5.2		# Note: check source directory name when updating this
pkgdesc="The GNU Compiler Collection, version 4.4.7 - multilib version"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.21' 'libmpc' 'cloog' 'elfutils' 'dejagnu' 'glibc>=2.11.1-2' 'lib32-glibc>=2.12.1')
conflicts=('gcc44') # Existing package from AUR
provides=('gcc44')
options=('!libtool' '!buildflags' '!emptydirs' 'staticlibs')
source=(
        http://ftpmirror.gnu.org/gcc/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2
        #ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2 <- the one over is 'optimized', it chooses the right mirror for you
	    ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-api-${_libstdcppmanver}.man.tar.bz2 # can't be automagically resolved, doh
	    gcc_pure64.patch
	    gcc-hash-style-both.patch
        siginfo_t_fix.patch
        texinfo_5_fix.patch)
md5sums=('3bda0831d654964ee152c46fa8d29e46'
         '5494ba2227ccbd7c90f318723b0e7fe5'
         '2776eab5ebb7f9cc62dd2199a3a24382'
         '22cec272f9cc2801d3cd348feaca888b'
         '6fd395bacbd7b6e47c7b74854b478363'
         'edce21b2ce295478d14d5dd988eb3287'
         'b912353cccf62a1ee3ea0ed18fadf71a')

prepare() {

  cd ${srcdir}/gcc-${pkgver}

  # "Add" ppl-0.11 compatibility
  sed -i "/ppl_minor_version=/s#10#11#" configure
  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in
  # Do not run fixincludes
  #sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ${srcdir}/gcc_pure64.patch
  fi
  patch -Np1 -i ${srcdir}/siginfo_t_fix.patch
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
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      --mandir=/usr/share/man \
      --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++ \
      --enable-shared \
      --enable-threads=posix \
      --enable-__cxa_atexit \
      --enable-clocale=gnu \
      --enable-gnu-unique-object \
      --enable-lto \
      --enable-plugin \
      --enable-gold \
      --with-plugin-ld=ld.gold \
      --enable-multilib \
      --disable-libstdcxx-pch \
      --with-system-zlib \
      --with-ppl \
      --with-cloog \
      --disable-libunwind-exceptions \
      --enable-linker-build-id \
      --enable-cloog-backend=isl \
      --enable-ld=default \
      --enable-checking=release \
      --disable-werror \
      --program-suffix=-4.4 \
      --enable-version-specific-runtime-libs 
  make

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  # ulimit -s 32768

  # do not abort on error as some are "expected"
  # make -k check || true
  # ${_basedir}/contrib/test_summary
}

# Used the same package() as gcc45 (AUR).
package()
{
  cd ${srcdir}/gcc-build

  make DESTDIR=${pkgdir} install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/

  install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION

}

