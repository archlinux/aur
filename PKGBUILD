# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felix Schindler <felix at schindlerfaimly dot de>
# Contributor: Allan McRae <allan@archlinux.org>
#
# This PKGBUILD has been maintained at https://github.com/ftalbrecht/aur
# in the gcc48 branch

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.8'
pkgname="gcc${_pkgver//\./}"
pkgver="${_pkgver}.5"
pkgrel='1'
pkgdesc="The GNU Compiler Collection - C and C++ frontends (${_pkgver}.x)"
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib')
makedepends=('binutils>=2.24' 'libmpc' 'doxygen')
makedepends+=('cloog' 'texinfo')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' 'staticlibs' '!libtool' '!buildflags')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  'gcc-4.9-fix-build-with-gcc-6.patch'
  'gcc.texi.49.patch'
  '0000-gcc-4.8.ucontext.patch'
  '0001-gcc-4.8-SIGSEGV.patch'
  '0002-gcc-4.8-__res_state.patch'
)
md5sums=('80d2c2982a3392bb0b89673ff136e223'
         '91f27a8002df38cf2ca971ca80feb9d7'
         'f3c42a9cfa840a062897da0468102771'
         '8f084394d4fe2ab274e630dc6a0a447c'
         'a6f33d46ea4d02c1694d097e3da95e40'
         'a86fb06dcff2bad4788fb03e4fde5e38')
sha256sums=('22fb1e7e0f68a63cee631d85b20461d1ea6bda162f03096350e38c8d427ecf23'
            'd775a053fad367f5490111038fde7c875b4e842919d2d197f95b915e1ae562a9'
            '9f8c50a715a921d3d2c9d5809ac9592ca66f682b2cc496606ff6eb4de79d46b6'
            '5724ec27e31db32ed863871bc904f0f9cd7f41fe85f45269249ea0fa6ff2a576'
            'e993f694c175d913c7bb6dd867ab0cdd9d81374e89de9b85151aa022b61bf3ef'
            'a465907ce3989f2763ac022afedd8b0200c012499e24fa1748412cd1c28b11ea')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  set -u
  cd "${_basedir}"

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # fix build with GCC 6
  patch -Nup1 < "${srcdir}/gcc-4.9-fix-build-with-gcc-6.patch"

  # Update gcc.texi to gcc49 version, needed as of texinfo>=6.3 and possibly texinfo=6.2
  # diff -pNau5 gcc/doc/gcc.texi{,.49} > 'gcc.texi.49.patch'
  patch -Nup0 < "${srcdir}/gcc.texi.49.patch"

  # fix build with glibc 2.26
  #diff -pNau5 libsanitizer/tsan/tsan_interceptors.cc{.orig,} > '../0000-gcc-4.8.ucontext.patch'
  patch -Nbup0 -i "${srcdir}/0000-gcc-4.8.ucontext.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41921
  #diff -pNau5 libsanitizer/asan/asan_linux.cc{.orig,} > '../0001-gcc-4.8-SIGSEGV.patch'
  patch -Nbup0 -i "${srcdir}/0001-gcc-4.8-SIGSEGV.patch"
  #diff -pNau5 libsanitizer/tsan/tsan_platform_linux.cc{.orig,} > '../0002-gcc-4.8-__res_state.patch'
  patch -Nbup0 -i "${srcdir}/0002-gcc-4.8-__res_state.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41922
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')
  sed -e '/^struct ucontext_t/,/^};/ d' -i 'libsanitizer/tsan/tsan_interceptors.cc'
  if grep -e '^struct ucontext_t' 'libsanitizer/tsan/tsan_interceptors.cc'; then
    set +u
    echo 'Failed to remove ^struct ucontext_t'
    false
  fi

  # Arch Linux installs x86_64 libraries /lib
  case "${CARCH}" in
  'x86_64') sed -e '/m64=/ s/lib64/lib/' -i 'gcc/config/i386/t-linux64' ;;
  esac

  echo "${pkgver}" > 'gcc/BASE-VER'

  # installing libiberty headers is broken
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=56780#c6
  sed -e 's#@target_header_dir@#libiberty#' -i 'libiberty/Makefile.in'

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  if [ ! -s "${_basedir}/gcc-build/Makefile" ]; then
    cd "${_basedir}"

    cd 'gcc-build'
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --disable-multilib
      --disable-werror
      --enable-__cxa_atexit
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-cloog-backend='isl'
      --enable-gnu-unique-object
      --enable-gold
      --enable-languages='c,c++,fortran'
      --enable-ld='default'
      --enable-linker-build-id
      --enable-lto
      --enable-plugin
      --enable-shared
      --enable-threads='posix'
      --enable-version-specific-runtime-libs
      --infodir='/usr/share/info'
      --libdir='/usr/lib'
      --libexecdir='/usr/lib'
      --mandir='/usr/share/man'
      --program-suffix="-${_pkgver}"
      --with-bugurl='https://bugs.archlinux.org/'
      --with-plugin-ld='ld.gold'
      --with-ppl
      --with-system-zlib
      --prefix='/usr'
      #CXX='g++-4.9' CC='gcc-4.9'
    )
    ../configure "${_conf[@]}"

    sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  cd "${srcdir}/${_basedir}/gcc-build"
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice make -s

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
  rm -rf "${pkgdir}/usr"/{share,include}/
  find "${pkgdir}/" -name '*iberty*' -exec rm '{}' '+'

  # Move potentially conflicting stuff to version specific subdirectory
  case "${CARCH}" in
  'x86_64') mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/" ;;
  esac
  #mv "${pkgdir}/usr/lib"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
