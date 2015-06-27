# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=gcc47
_ver=4.7
pkgver=4.7.4
pkgrel=1
pkgdesc="The GNU Compiler Collection (4.7.x)"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
depends=('glibc>=2.17' 'binutils>=2.23' 'libmpc' 'cloog' 'ppl')
groups=('base-devel')
makedepends=('binutils>=2.23' 'libmpc' 'cloog' 'ppl')
checkdepends=('dejagnu')
options=('!libtool' '!emptydirs' 'staticlibs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2)
	#ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
md5sums=('4c696da46297de6ae77a82797d2abe28')

if [ -n "${_snapshot}" ]; then
  _basedir=gcc-${_snapshot}
else
  _basedir=gcc-${pkgver}
fi

build() {
  cd ${srcdir}/${_basedir}

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  # Doesn't like FORTIFY_SOURCE
  CPPFLAGS=${CPPFLAGS//-D_FORTIFY_SOURCE=?/}
  export CPPFLAGS

  # Doesn't like stack-protector-strong
  CFLAGS=${CFLAGS//-fstack-protector-strong/-fstack-protector}
  export CFLAGS
  CXXFLAGS=${CXXFLAGS//-fstack-protector-strong/-fstack-protector}
  export CXXFLAGS

  echo ${pkgver} > gcc/BASE-VER

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  cd ${srcdir}
  mkdir gcc-build && cd gcc-build

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,fortran \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --enable-libstdcxx-time \
      --enable-gnu-unique-object --enable-linker-build-id \
      --with-ppl --enable-cloog-backend=isl \
      --disable-ppl-version-check --disable-cloog-version-check \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --with-linker-hash-style=gnu \
      --disable-multilib --disable-libssp \
      --disable-build-with-cxx --disable-build-poststage1-with-cxx \
      --program-suffix=-${_ver} --enable-version-specific-runtime-libs \
      --enable-checking=release
  make
}

_check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${_basedir}/contrib/test_summary
}

package() {
  cd ${srcdir}/gcc-build

  make -j1 DESTDIR=${pkgdir} install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/

  # Move potentially conflicting stuff to version specific subdirectory
  mv "$pkgdir"/usr/lib/gcc/$CHOST/lib* "$pkgdir/usr/lib/gcc/$CHOST/$pkgver/" || true

  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}
