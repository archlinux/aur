# Maintainer: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname='gcc46-multilib'
pkgver=4.6.4
pkgrel=4
_ver=${pkgver%.*}
pkgdesc="The GNU Compiler Collection for multilib (4.6.x)"
arch=('x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.24' 'libmpc' 'cloog' 'ppl' 'lib32-glibc>=2.14')
conflicts=('gcc46') # Package from AUR
provides=('gcc46')
options=('staticlibs' '!libtool' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
	gcc-hash-style-both.patch)
md5sums=('b407a3d1480c11667f293bfb1f17d1a4'
         '4df25b623799b148a0703eaeec8fdf3f')


if [ -n "${_snapshot}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

build() {
  cd ${srcdir}/${_basedir}

  # "Add" ppl-0.11 compatibility
  sed -i "/ppl_minor_version=/s#10#11#" configure

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  #if [ "${CARCH}" = "x86_64" ]; then
  #  : patch -Np1 -i ${srcdir}/gcc_pure64.patch
  #fi
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
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --enable-multilib --disable-libssp \
      --enable-checking=release --with-fpmath=sse --disable-werror \
      --program-suffix=-${pkgver} --enable-version-specific-runtime-libs 
  make

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  # ulimit -s 32768

  # do not abort on error as some are "expected"
  # make -k check || true
  # ${srcdir}/${_basedir}/contrib/test_summary
}

# Used the same package() as gcc45 (AUR).
package()
{
  cd ${srcdir}/gcc-build

  make -j1 DESTDIR=${pkgdir} install

  if [ "${CARCH}" = "x86_64" ]; then
    ## Move conflicting libraries
    _gccbasedir=${pkgdir}/usr/lib/gcc/x86_64-unknown-linux-gnu
    mv ${_gccbasedir}/lib32/* ${_gccbasedir}/${pkgver}/32/
    mv ${_gccbasedir}/lib64/* ${_gccbasedir}/${pkgver}/
    rmdir ${_gccbasedir}/{lib32,lib64}
  fi
  
  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf ${pkgdir}/usr/share/

  ## Symlink to minor version
  for tool in {,x86_64-unknown-linux-gnu-}{c++,g++,gcc,gfortran} cpp gcov; do
    ln -s ${tool}-${pkgver} ${pkgdir}/usr/bin/${tool}-${_ver}
  done

  install -Dm644 ${srcdir}/gcc-${pkgver}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/$pkgname/RUNTIME.LIBRARY.EXCEPTION
}

