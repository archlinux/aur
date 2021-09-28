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
pkgver="${_pkgver}.4"
_islver='0.12.2'
_cloogver='0.18.1'
pkgrel='2'
#_snapshot=4.9-20150304
pkgdesc="The GNU Compiler Collection for multilib (${_pkgver}.x)"
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib')
makedepends=('binutils>=2.25' 'libmpc' 'doxygen')
makedepends+=('lib32-glibc>=2.20' 'texinfo')
checkdepends=('dejagnu' 'inetutils')
provides=("gcc${_pkgver//\./}") # no version as it is completely contained in the name
conflicts=("gcc${_pkgver//\./}")
options=('!emptydirs' '!strip' '!buildflags')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
  'gcc-4.9-fix-build-with-gcc-6.patch'
  '0000-gcc-4.9.ucontext.patch'
  '0001-gcc-4.9-SIGSEGV.patch'
  '0002-gcc-4.9-__res_state.patch'
)
md5sums=('87c24a4090c1577ba817ec6882602491'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252'
         '91f27a8002df38cf2ca971ca80feb9d7'
         '4a0dc704f1d92ceb4dd8608811241cec'
         'e787a03f0c38434490515a5823eca0b8'
         'c64d1e20274ff4fbfacdd11bef2e1273')
sha256sums=('6c11d292cd01b294f9f84c9a59c230d80e9e4a47e5c6355f046bb36d4f358092'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196'
            'd775a053fad367f5490111038fde7c875b4e842919d2d197f95b915e1ae562a9'
            '44ea987c9ee1ab3234f20eca51f8d6c68910b579e63ec58ff7a0dde38093f6ba'
            'eb59578cbf32da94d7a11fabf83950c580f0f6fb58f893426d6a258b7e44351e'
            '9ce8a94aad61a26839687734b48f0628e610663cd0d5ad9edfc6e571cf294bac')

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
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # fix build with GCC 6
  #patch -p1 < "${srcdir}/gcc-4.9-fix-build-with-gcc-6.patch"

  # fix build with glibc 2.26
  #diff -pNau5 libsanitizer/sanitizer_common/sanitizer_linux.h{.orig,} > '../0000-gcc-4.9.ucontext.patch'
  patch -Nbup0 -i "${srcdir}/0000-gcc-4.9.ucontext.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41921
  #diff -pNau5 libsanitizer/asan/asan_linux.cc{.orig,} > '../0001-gcc-4.9-SIGSEGV.patch'
  patch -Nbup0 -i "${srcdir}/0001-gcc-4.9-SIGSEGV.patch"
  #diff -pNau5 libsanitizer/tsan/tsan_platform_linux.cc{.orig,} > '../0002-gcc-4.9-__res_state.patch'
  patch -Nbup0 -i "${srcdir}/0002-gcc-4.9-__res_state.patch" # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41922
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

  if ! grep -qFxe "${pkgver%%_*}" 'gcc/BASE-VER'; then
    echo "Version has changed from ${pkgver%%_*} to"
    cat 'gcc/BASE-VER'
    set +u
    false
  fi

  # remove -V and -qversion as their aren't supported in gcc7
  sed -e 's/ -V -qversion/ /g' -i $(grep --include='configure' -lrFe '-V -qversion')

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  cd "${_basedir}/gcc-build"

  if [ ! -s 'Makefile' ]; then
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --disable-libsanitizer
      --enable-multilib
      --disable-werror
      --enable-__cxa_atexit
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-cloog-backend='isl'
      --enable-gnu-unique-object
      --enable-install-libiberty
      --enable-languages='c,c++,fortran,go,lto,objc,obj-c++'
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
      --with-linker-hash-style='gnu'
      --with-system-zlib
      --prefix='/usr'
      # CXX='g++-6.3' CC='gcc-6.3'
# gcc-5.0 changes
#      --with-default-libstdcxx-abi=c++98    - before gcc-5.0 c++ rebuild
#      --enable-gnu-indirect-function
#      --with-isl    - cloog no longer needed
    )
    ../configure "${_conf[@]}"

     sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice make -s

  set +u; msg 'Compile complete'; set -u

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
  'x86_64') mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver%%_*}/" ;;
  esac
  #mv "${pkgdir}/usr/lib"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver%%_*}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
