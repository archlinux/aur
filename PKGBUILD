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
url='https://gcc.gnu.org'
license=('GPL-2.0-only' 'LGPL-2.1-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'GFDL-1.3-only' 'LicenseRef-custom')
depends=('gcc-libs' 'glibc' 'bash' 'zlib')
makedepends=('binutils>=2.25' 'libmpc' 'doxygen')
makedepends+=('lib32-glibc>=2.20' 'texinfo')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs' '!strip' '!buildflags')
options+=('!lto')
source=(
  "https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
  #"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "https://gcc.gnu.org/pub/gcc/infrastructure/isl-${_islver}.tar.bz2"
  #"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
  "https://gcc.gnu.org/pub/gcc/infrastructure/cloog-${_cloogver}.tar.gz"
  '0000-gcc-4.9.ucontext.patch' # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41921
  '0001-gcc-4.9-SIGSEGV.patch'
  '0002-gcc-4.9-__res_state.patch' # https://gcc.gnu.org/bugzilla/attachment.cgi?id=41922
  '0003-gcc-4.9-ustate.patch'
  '0004-glibc-2.31-libsanitizer.patch'
  '78_all-libsanitizer-Fix-build-with-glibc-2.42.patch'
  '79_all-sanitizer_common-Remove-reference-to-obsolete-termio.patch'
)
md5sums=('87c24a4090c1577ba817ec6882602491'
         'e039bfcfb6c2ab039b8ee69bf883e824'
         'e34fca0540d840e5d0f6427e98c92252'
         '561b4aba389c36b5f39780561afb715e'
         '36fcc8fe31569c24b8c7eb89fe11f530'
         'f4d0a6afd0a61392b08d34b47d5ea526'
         '4bf02ae62e3e90c3a511c31527c8da39'
         'b05cdc7644512ea986ecf256c2850486'
         '0ca216af666669239bb5bab91332a9dc'
         '39fe3813c06ae8adf559339e73e1aad4')
sha256sums=('6c11d292cd01b294f9f84c9a59c230d80e9e4a47e5c6355f046bb36d4f358092'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196'
            '2c4e96f21d73f64c01a1acdeaad1f018a325e0d183b5e743fe89ced2bf35adf5'
            'd42c5e2a71a412afa6a01e29e5fbe6971d6db2ab6d8b2f8f621b1a9c9edcb699'
            'dbc29290f3f9abe45b0ddf8bf12f8e74fd0c65a11dafecab495d44f6ae9f9428'
            '531f00fff2a1b790a8c5145aa86f62d17cb7c1d76d92849710f01a5529b88d6d'
            '1c6109d9b3d67bf71c04c13349d22336d4721ebf57c92d94f0809d8295d0cc83'
            '8cfc1a2443046484748006a033ad471284219634d0fa87beaf8db121a8eb0cd4'
            '321d89d5af8df8a7550e9a6a099f3cf1c174d4e932d5a007624baa7f72809f00')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  set -u
  cd "${_basedir}"

  # link isl for in-tree build
  ln -s "../isl-${_islver}" 'isl'
  ln -s "../cloog-${_cloogver}" 'cloog'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

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

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  #sed -e '/ac_cpp=/s/$CPPFLAGS/$CPPFLAGS -O2/' -i {libiberty,gcc}/configure

  # Apply patches
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    case "${_pt}" in
    *.patch)
      set +u; msg2 "*** Applying patch ${_pt}"; set -u
      patch --no-backup-if-mismatch -Np1 -i "${srcdir}/${_pt}"
      ;;
    esac
  done

  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')
  sed -e '/^struct ucontext_t/,/^};/ d' -i 'libsanitizer/tsan/tsan_interceptors.cc'
  if grep -e '^struct ucontext_t' 'libsanitizer/tsan/tsan_interceptors.cc'; then
    set +u
    echo 'Failed to remove ^struct ucontext_t'
    false
  fi

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
      --with-bugurl="https://aur.archlinux.org/packages/${pkgname}/"
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
  nice -n1 make -s

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
  make -j1 -s DESTDIR="${pkgdir}" install

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
