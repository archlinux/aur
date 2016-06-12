# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felix Schindler <felix at schindlerfaimly dot de>
# Contributor: Allan McRae <allan@archlinux.org>
#
# This PKGBUILD has been maintained at https://github.com/ftalbrecht/aur
# in the gcc48 branch

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname='gcc48'
_pkgver='4.8'
pkgver="${_pkgver}.5"
pkgrel='1'
pkgdesc="The GNU Compiler Collection - C and C++ frontends (${_pkgver}.x)"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
makedepends=('binutils>=2.24' 'libmpc' 'doxygen')
makedepends+=('cloog')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' 'staticlibs' '!libtool')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  "gcc-4.9-fix-build-with-gcc-6.patch"
)
sha256sums=('22fb1e7e0f68a63cee631d85b20461d1ea6bda162f03096350e38c8d427ecf23'
            'd775a053fad367f5490111038fde7c875b4e842919d2d197f95b915e1ae562a9')
PKGEXT='.pkg.tar.gz'

  _basedir="gcc-${pkgver}"

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  cd "${_basedir}"

  # Do not run fixincludes
  sed -i -e 's@\./fixinc\.sh@-c true@' 'gcc/Makefile.in'

  # fix build with GCC 6
  patch -p1 < "${srcdir}/gcc-4.9-fix-build-with-gcc-6.patch"

  # Arch Linux installs x86_64 libraries /lib
  case "${CARCH}" in
  'x86_64') sed -i -e '/m64=/s/lib64/lib/' 'gcc/config/i386/t-linux64' ;;
  esac

  echo "${pkgver}" > 'gcc/BASE-VER'

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i -e '/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/' {libiberty,gcc}/configure

  # installing libiberty headers is broken
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56780#c6
  sed -i -e 's#@target_header_dir@#libiberty#' 'libiberty/Makefile.in'

  mkdir "${srcdir}/gcc-build"

  # build
  cd "${srcdir}/gcc-build"

  # Doesn't like FORTIFY_SOURCE
  export CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=?/}"

  # Doesn't like -fstack-protector-strong
  export CFLAGS="${CFLAGS//-fstack-protector-strong/-fstack-protector}"
  export CXXFLAGS="${CXXFLAGS//-fstack-protector-strong/-fstack-protector}"

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  export CFLAGS="${CFLAGS/-pipe/}"
  export CXXFLAGS="${CXXFLAGS/-pipe/}"

  # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
  "${srcdir}/${_basedir}/configure" \
    --build="${CHOST}" \
    --disable-libstdcxx-pch \
    --disable-libunwind-exceptions \
    --disable-multilib \
    --disable-werror \
    --enable-__cxa_atexit \
    --enable-checking='release' \
    --enable-clocale='gnu' \
    --enable-cloog-backend='isl' \
    --enable-gnu-unique-object \
    --enable-gold \
    --enable-languages='c,c++,fortran' \
    --enable-ld=default \
    --enable-linker-build-id \
    --enable-lto \
    --enable-plugin \
    --enable-shared \
    --enable-threads='posix' \
    --enable-version-specific-runtime-libs \
    --infodir='/usr/share/info' \
    --libdir='/usr/lib' \
    --libexecdir='/usr/lib' \
    --mandir='/usr/share/man' \
    --program-suffix="-${_pkgver}" \
    --with-bugurl='https://bugs.archlinux.org/' \
    --with-plugin-ld='ld.gold' \
    --with-ppl \
    --with-system-zlib \
    --prefix='/usr'
#    CXX='g++-4.9' CC='gcc-4.9'
}

build() {
  cd "${srcdir}/gcc-build"

  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -s -j "${_nproc}"

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
}

_fn_check() {
  cd "${srcdir}/gcc-build"

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || :
  "${srcdir}/${_basedir}/contrib/test_summary"
}

package()
{
  cd "${srcdir}/gcc-build"

  make -s -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr"/{share,include}/
  find "${pkgdir}/" -name '*iberty*' | xargs rm

  # Move potentially conflicting stuff to version specific subdirectory
  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Install Runtime Library Exception
  install -Dm644 "${srcdir}/gcc-${pkgver}/COPYING.RUNTIME" \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION"
}
