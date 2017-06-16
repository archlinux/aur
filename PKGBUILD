# $Id$
# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='6.3'
pkgname="gcc${_pkgver//\./}-multilib"
_snapshot='6-20170614'
pkgver="${_pkgver}_${_snapshot#*-}"
_islver='0.17'
#_commit='4fc407888a30c5d953816b05c8a8e98ec2ab3101' # Pulling commits this big is too slow!
pkgrel='1'
pkgdesc="The GNU Compiler Collection for multilib (${_pkgver}.x)"
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib')
# removed ada, don't know where to get ada-multilib
makedepends=('binutils>=2.28' 'libmpc' 'doxygen')
makedepends+=('lib32-glibc>=2.25')
makedepends+=('git')
checkdepends=('dejagnu' 'inetutils')
provides=("gcc${_pkgver//\./}") # no version as it is completely contained in the name
conflicts=("gcc${_pkgver//\./}")
options=('!emptydirs' '!strip')
source=(
  #"git+https://gcc.gnu.org/git/gcc.git#commit=${_commit}"
  #"gcc-${pkgver%%_*}.tgz::https://github.com/gcc-mirror/gcc/archive/${_commit}.tar.gz"
  "http://mirrors.concertpass.com/gcc/snapshots/LATEST-6/gcc-${_snapshot}.tar.xz" # Please do not use a snapshot before it has been announced with a LATEST- symlink.
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
)
sha256sums=('ec36462b9a8388accca91ffae190eb696e5fade4a5e1c573be349448ee4b31ac'
            '439b322f313aef562302ac162caccb0b90daedf88d49d62e00a5db6b9d83d6bb')
PKGEXT='.pkg.tar.gz'

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST:-}/${pkgver%%_*}"

prepare() {
  set -u
  cd "${_basedir}"

  # link isl for in-tree build
  ln -s "../isl-${_islver}" 'isl'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # Arch Linux installs x86_64 libraries /lib
  case "${CARCH}" in
  'x86_64') sed -e '/m64=/ s/lib64/lib/' -i 'gcc/config/i386/t-linux64' ;;
  esac

  echo "${_pkgver}" > 'gcc/BASE-VER'

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -e '/^ac_cpp=/ s/$CPPFLAGS/$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

  rm -rf 'gcc-build'
  mkdir 'gcc-build'
  set +u
}

build() {
  set -u
  cd "${_basedir}/gcc-build"

  if [ ! -s 'Makefile' ]; then
    # using -pipe causes spurious test-suite failures
    # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
    CFLAGS="${CFLAGS/-pipe/}" \
    CXXFLAGS="${CXXFLAGS/-pipe/}" \
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
      --enable-gnu-indirect-function \
      --enable-gnu-unique-object \
      --enable-install-libiberty \
      --enable-languages='c,c++,fortran,go,lto,objc,obj-c++' \
      --enable-libmpx \
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
      --with-isl \
      --with-linker-hash-style='gnu' \
      --with-system-zlib \
      --prefix='/usr'
#      CXX='g++-4.9' CC='gcc-4.9'
  fi

  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -s -j "${_nproc}"

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
  set +u
}

_check_disabled() {
  set -u
  cd "${_basedir}/gcc-build"

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || :
  "${srcdir}/gcc/contrib/test_summary"
  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  make -s -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr"/{share,include}/
  find "${pkgdir}/" -name '*iberty*' -exec rm '{}' '+'

  # Move potentially conflicting stuff to version specific subdirectory
  case "${CARCH}" in
  'x86_64') mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${_pkgver}/" ;;
  esac
  mv "${pkgdir}/usr/lib"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${_pkgver}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
