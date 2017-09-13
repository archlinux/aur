# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.7'
pkgname="gcc${_pkgver//\./}-multilib"
pkgver="${_pkgver}.4"
pkgrel='1'
pkgdesc="The GNU Compiler Collection for multilib (${_pkgver}.x)"
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
#groups=('base-devel')
depends=('glibc>=2.17' 'binutils>=2.23' 'libmpc' 'cloog' 'ppl')
makedepends=('flex' 'bison' 'setconf')
#makedepends+=('gcc49')
checkdepends=('dejagnu')
options=('staticlibs' '!libtool' '!emptydirs')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
  'gcc.texi.49.patch'
)
sha256sums=('92e61c6dc3a0a449e62d72a38185fda550168a86702dea07125ebd3ec3996282'
            '9f8c50a715a921d3d2c9d5809ac9592ca66f682b2cc496606ff6eb4de79d46b6')
PKGEXT='.pkg.tar.gz'

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

prepare() {
  set -u
  cd "${_basedir}"

  # Do not install libiberty
  sed -e 's/install_to_$(INSTALL_DEST) //' -i 'libiberty/Makefile.in'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # Update gcc.texi to gcc49 version, needed as of texinfo>=6.3 and possibly texinfo=6.2
  # diff -pNau5 gcc/doc/gcc.texi{,.49} > 'gcc.texi.49.patch'
  patch -Nup0 -i "${srcdir}/gcc.texi.49.patch"

  # fix build with glibc 2.26
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')

  # Arch Linux installs x86_64 libraries /lib
  case "${CARCH}" in
  'x86_64') sed -e '/m64=/ s/lib64/lib/' -i 'gcc/config/i386/t-linux64' ;;
  esac

  echo "${pkgver}" > 'gcc/BASE-VER'

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  if [ ! -s "${_basedir}/gcc-build/Makefile" ]; then
    cd "${_basedir}"
    # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
    sed -e '/^ac_cpp=/ s/\$CPPFLAGS/\$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

    # Doesn't like FORTIFY_SOURCE
    CPPFLAGS="${CPPFLAGS//-D_FORTIFY_SOURCE=?/}"

    # Doesn't like -fstack-protector-strong
    CFLAGS="${CFLAGS//-fstack-protector-strong/-fstack-protector}"
    CXXFLAGS="${CXXFLAGS//-fstack-protector-strong/-fstack-protector}"

    # using -pipe causes spurious test-suite failures
    # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
    CFLAGS="${CFLAGS/-pipe/}"
    CXXFLAGS="${CXXFLAGS/-pipe/}"

    # Flags from new compilers that old compilers don't recognize
    CFLAGS="${CFLAGS/-fno-plt/}"
    CXXFLAGS="${CXXFLAGS/-fno-plt/}"

    CFLAGS="${CFLAGS/-Wformat-overflow=[0-9]/}"
    CXXFLAGS="${CXXFLAGS/-Wformat-overflow=[0-9]/}"

    cd 'gcc-build'
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    ../configure \
      --build="${CHOST}" \
      --disable-build-poststage1-with-cxx \
      --disable-build-with-cxx \
      --disable-cloog-version-check \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-libunwind-exceptions \
      --enable-multilib \
      --disable-ppl-version-check \
      --enable-__cxa_atexit \
      --enable-checking='release' \
      --enable-clocale='gnu' \
      --enable-cloog-backend='isl' \
      --enable-gnu-unique-object \
      --enable-gold \
      --enable-languages='c,c++,fortran' \
      --enable-ld='default' \
      --enable-libstdcxx-time \
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
      --with-plugin-ld='ld.gold' \
      --with-ppl \
      --with-system-zlib \
      --prefix='/usr'
#      CXX='g++-4.9' CC='gcc-4.9'
  fi

  cd "${srcdir}/${_basedir}/gcc-build"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice make -j "${_nproc}"

  set +u
}

_fn_check() {
  set -u
  cd "${_basedir}/gcc-build"

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -j1 -k check || :
  "${srcdir}/${_basedir}/contrib/test_summary"
  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr/share/"

  # Move potentially conflicting stuff to version specific subdirectory
  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/" || true

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
