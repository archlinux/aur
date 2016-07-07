# $Id$
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felix Schindler <felix at schindlerfaimly dot de>
# Contributor: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Yurii Kolesnykov (yurikooles) <yurikoles@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.9'
pkgname="gcc${_pkgver//\./}-multilib"
pkgver="${_pkgver}.3"
_islver='0.12.2'
_cloogver='0.18.1'
pkgrel='3'
#_snapshot=4.9-20150304
pkgdesc="The GNU Compiler Collection for multilib (${_pkgver}.x)"
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib')
makedepends=('binutils>=2.25' 'libmpc' 'doxygen')
makedepends+=('lib32-glibc>=2.20')
checkdepends=('dejagnu' 'inetutils')
provides=("gcc${_pkgver//\./}") # no version as it is completely contained in the name
conflicts=("gcc${_pkgver//\./}")
options=('!emptydirs')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
  "gcc-4.9-fix-build-with-gcc-6.patch"
)
sha256sums=('2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196'
            'd775a053fad367f5490111038fde7c875b4e842919d2d197f95b915e1ae562a9')
PKGEXT='.pkg.tar.gz'

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  set -u
  cd "${_basedir}"

  # link isl/cloog for in-tree builds
  ln -s "../isl-${_islver}" 'isl'
  ln -s "../cloog-${_cloogver}" 'cloog'

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

  # Doesn't like FORTIFY_SOURCE
  export CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=?/}"

  # Doesn't like -fstack-protector-strong
  export CFLAGS="${CFLAGS//-fstack-protector-strong/-fstack-protector}"
  export CXXFLAGS="${CXXFLAGS//-fstack-protector-strong/-fstack-protector}"

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  export CFLAGS="${CFLAGS/-pipe/}"
  export CXXFLAGS="${CXXFLAGS/-pipe/}"

  rm -rf 'gcc-build'
  mkdir 'gcc-build'
  cd 'gcc-build'

  # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
  ../configure \
    --build="${CHOST}" \
    --disable-libssp \
    --disable-libstdcxx-pch \
    --disable-libunwind-exceptions \
    --enable-multilib \
    --disable-werror \
    --enable-__cxa_atexit \
    --enable-checking='release' \
    --enable-clocale='gnu' \
    --enable-cloog-backend='isl' \
    --enable-gnu-unique-object \
    --enable-install-libiberty \
    --enable-languages='c,c++,fortran,go,lto,objc,obj-c++' \
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
    --with-linker-hash-style='gnu' \
    --with-system-zlib \
    --prefix='/usr'
#    CXX='g++-4.9' CC='gcc-4.9'

# gcc-5.0 changes
#      --with-default-libstdcxx-abi=c++98    - before gcc-5.0 c++ rebuild
#      --enable-gnu-indirect-function
#      --with-isl    - cloog no longer needed
  set +u
}

build() {
  set -u
  cd "${_basedir}/gcc-build"

  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  make -s -j "${_nproc}"

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
  set +u
}

_fn_check() {
  set -u
  cd "${_basedir}/gcc-build"

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || :
  "${srcdir}/${_basedir}/contrib/test_summary"
  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  make -s -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr"/{share,include}/
  find "${pkgdir}/" -name '*iberty*' | xargs rm

  # Move potentially conflicting stuff to version specific subdirectory
  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/" || : # Not needed for 32 bit compile

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
