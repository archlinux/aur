# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alain Kalker <a {dot} c {dot} kalker "at" gmail {dot} com>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.6'
pkgname="gcc${_pkgver//\./}-multilib"
pkgver="${_pkgver}.4"
pkgrel='4'
pkgdesc="The GNU Compiler Collection for multilib (${_pkgver}.x)"
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL-2.0-only' 'LGPL-2.1-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'GFDL-1.3-only' 'custom')
depends=('glibc' 'lib32-glibc' 'gcc-libs' 'lib32-gcc-libs' 'bash' 'zlib')
makedepends=('binutils>=2.24' 'libmpc' 'cloog' 'ppl')
makedepends+=('lib32-glibc>=2.14' 'texinfo')
provides=("gcc${_pkgver//\./}") # no version as it is completely contained in the name
conflicts=("gcc${_pkgver//\./}")
options=('staticlibs' '!libtool' '!emptydirs' '!buildflags')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  'gcc-hash-style-both.patch'
  'gcc.texi.49.patch'
  '0000-sourcebuild.texi-itemx.patch'
  '0001-tm.texi-end-deftypevr.patch'
)
md5sums=('b407a3d1480c11667f293bfb1f17d1a4'
         '9266231597c48aa83bf78abc755fe373'
         '1fb9648fbc183982542490cf8d5a9c58'
         '031d8f46e75b22771317d2fc9967953b'
         '731b9d288a80460059810bcc4f39f5d8')
sha256sums=('35af16afa0b67af9b8eb15cafb76d2bc5f568540552522f5dc2c88dd45d977e8'
            'ad5261225e7fe94ed590ad8ef98251a6fa5c15ee2f49f60fbac1c61b5735fee4'
            '728cb6e732408eb9675eea793b55c0b073357dcd533c6fa9fc4acd8547650362'
            'b6c00e4dadf3a0180fc1db110b275768a8e0490a65182dc8e42fbcb639a28141'
            'e6f553c1dae9fab0ab586ebf91f497cc02ef1a5ed35001ac50ec5a63b7736af4')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

prepare() {
  set -u
  cd "${_basedir}"

  # "Add" ppl-0.11 compatibility
  sed -e '/ppl_minor_version=/s#10#11#' -i 'configure'

  # Do not install libiberty
  sed -e 's/install_to_$(INSTALL_DEST) //' -i 'libiberty/Makefile.in'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  # Update gcc.texi to gcc49 version, needed as of texinfo>=6.3 and possibly texinfo=6.2
  # diff -pNau5 gcc/doc/gcc.texi{,.49} > 'gcc.texi.49.patch'
  patch -Nup1 -i "${srcdir}/gcc.texi.49.patch"

  #if [ "${CARCH}" = "x86_64" ]; then
  #  : patch -Np1 -i "${srcdir}/gcc_pure64.patch"
  #fi
  patch -Np1 -i "${srcdir}/gcc-hash-style-both.patch"
  patch -Np1 -i "${srcdir}/0000-sourcebuild.texi-itemx.patch"
  patch -Np1 -i "${srcdir}/0001-tm.texi-end-deftypevr.patch"

  #cd ..; cp -pr "${_basedir}" 'a'; ln -s "${_basedir}" 'b'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

  # fix build with glibc 2.26
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')

  echo "${pkgver}" > 'gcc/BASE-VER'

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
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --enable-multilib
      --disable-werror
      --enable-__cxa_atexit
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-cloog-backend='isl'
      --enable-gnu-unique-object
      --enable-gold
      --enable-languages='c,c++,fortran'
      --enable-ld='default'
      --enable-libstdcxx-time
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
      --with-fpmath='sse'
      --with-plugin-ld='ld.gold'
      --with-ppl
      --with-system-zlib
      --prefix='/usr'
      #CXX='g++-4.9' CC='gcc-4.9'
      #CXX='g++ -Wno-implicit-function-declaration -Wno-incompatible-pointer-types'
      #CC='gcc -Wno-implicit-function-declaration -Wno-incompatible-pointer-types'
    )
    ../configure "${_conf[@]}"

    sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  cd "${srcdir}/${_basedir}/gcc-build"
  LD_PRELOAD='/usr/lib/libstdc++.so' \
  nice make -s

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

# Used the same package() as gcc45 (AUR).
package() {
  set -u
  cd "${_basedir}/gcc-build"

  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -j1 DESTDIR="${pkgdir}" install

  if [ "${CARCH}" = 'x86_64' ]; then
    ## Move conflicting libraries
    local _gccbasedir="${pkgdir}/usr/lib/gcc/${CHOST}"
    mv "${_gccbasedir}/lib32"/* "${_gccbasedir}/${pkgver}/32/"
    mv "${_gccbasedir}/lib64"/* "${_gccbasedir}/${pkgver}/"
    rmdir "${_gccbasedir}"/{lib32,lib64}
  fi

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr/share/"

  ## Symlink to minor version
  #local _tool
  #for _tool in {,"${CHOST}-"}{c++,g++,gcc,gfortran} 'cpp' 'gcov'; do
  #  ln -s "${_tool}-${pkgver}" "${pkgdir}/usr/bin/${_tool}-${_pkgver}"
  #done

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
