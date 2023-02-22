# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Ruben Van Boxem <vanboxem.ruben@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>

set -u
_pkgver='4.9'
pkgname="gcc${_pkgver//\./}"
pkgver="${_pkgver}.4"
_islver='0.12.2'
_cloogver='0.18.1'
pkgrel='3'
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib')
makedepends=('binutils>=2.25' 'libmpc' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' '!strip' '!buildflags')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
  #"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "ftp://gcc.gnu.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
  #"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
  "ftp://gcc.gnu.org/pub/gcc/infrastructure/cloog-${_cloogver}.tar.gz"
  '0000-gcc-4.9.ucontext.patch'
  '0001-gcc-4.9-SIGSEGV.patch'
  '0002-gcc-4.9-__res_state.patch'
  '0003-gcc-4.9-ustate.patch'
  '0004-glibc-2.31-libsanitizer.patch'
)
md5sums=('87c24a4090c1577ba817ec6882602491'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252'
         '4a0dc704f1d92ceb4dd8608811241cec'
         'e787a03f0c38434490515a5823eca0b8'
         'c64d1e20274ff4fbfacdd11bef2e1273'
         'b27134678242f358c9b81cd73a1bcba1'
         '931ee06584a47f3bdb5ea57fa2d5f76f')
sha256sums=('6c11d292cd01b294f9f84c9a59c230d80e9e4a47e5c6355f046bb36d4f358092'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196'
            '44ea987c9ee1ab3234f20eca51f8d6c68910b579e63ec58ff7a0dde38093f6ba'
            'eb59578cbf32da94d7a11fabf83950c580f0f6fb58f893426d6a258b7e44351e'
            '9ce8a94aad61a26839687734b48f0628e610663cd0d5ad9edfc6e571cf294bac'
            '11f2adf34c32ec2d121a14cd10751d79c77aebe7e4592d4cfaa7190953bdf782'
            '526568532a879f2755fb7e834c1c55caae53252713562e21a51c861463cb5931')

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

  patch -Nbup0 -i "${srcdir}/0003-gcc-4.9-ustate.patch"
  patch -p1 -i "${srcdir}/0004-glibc-2.31-libsanitizer.patch"

  if ! grep -qFxe "${pkgver%%_*}" 'gcc/BASE-VER'; then
    echo "Version has changed from ${pkgver%%_*} to"
    cat 'gcc/BASE-VER'
    set +u
    false
  fi

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  #sed -e '/ac_cpp=/s/$CPPFLAGS/$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

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
      --disable-multilib
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

  # The GCC 4.9 library is otherwise found incorrectly when invoking host tools
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice make -s

  set +u; msg 'Compile complete'; set -u

  # make documentation
  make -s -j1 -C "${CHOST}/libstdc++-v3/doc" 'doc-man-doxygen'
  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  # The GCC 4.9 library is otherwise found incorrectly zhen invoking host tools
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr"/{share,include}/
  find "${pkgdir}/" -name '*iberty*' -delete

  # Move potentially conflicting stuff to version specific subdirectory
  case "${CARCH}" in
  'x86_64') mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib*/ "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver%%_*}/" ;;
  esac
  #mv "${pkgdir}/usr/lib"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver%%_*}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :

  # create 3 version symlinks (gcc-4.9.4 to gcc-4.9)
  cd "${pkgdir}/usr/bin"
  rm "${CHOST}-gcc-${pkgver}"
  local _i
  for _i in c++ cpp g++ gcc gcc-ar gcc-nm gcc-ranlib gfortran; do
    ln -s "${_i}-${_pkgver}" "${_i}-${pkgver}"
    ln -s "${CHOST}-${_i}-${_pkgver}" "${CHOST}-${_i}-${pkgver}"
  done
  ln -s "gcov-${_pkgver}" "gcov-${pkgver}"
  set +u
}
set +u
