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
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('zlib')
makedepends=('binutils>=2.24' 'libmpc' 'cloog' 'ppl')
makedepends+=('lib32-glibc>=2.14' 'texinfo')
provides=("gcc${_pkgver//\./}") # no version as it is completely contained in the name
conflicts=("gcc${_pkgver//\./}")
options=('staticlibs' '!libtool' '!emptydirs' '!buildflags')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  'gcc-hash-style-both.patch'
  'gcc.texi.49.patch'
)
md5sums=('b407a3d1480c11667f293bfb1f17d1a4'
         '4df25b623799b148a0703eaeec8fdf3f'
         'f3c42a9cfa840a062897da0468102771')
sha256sums=('35af16afa0b67af9b8eb15cafb76d2bc5f568540552522f5dc2c88dd45d977e8'
            '3492332fa78b545ff46c2b5293d17c63c122be6f8f6fa4798864b7d4572b0024'
            '9f8c50a715a921d3d2c9d5809ac9592ca66f682b2cc496606ff6eb4de79d46b6')

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
  patch -Nup0 -i "${srcdir}/gcc.texi.49.patch"

  #if [ "${CARCH}" = "x86_64" ]; then
  #  : patch -Np1 -i "${srcdir}/gcc_pure64.patch"
  #fi
  patch -Np0 -i "${srcdir}/gcc-hash-style-both.patch"

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
