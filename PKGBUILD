# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Felix Schindler <felix at schindlerfamily dot de>
# Contributor: Tianjiao Yin <ytj000(at)gmail(dot)(see)(oh)(em)>
#              Allan McRae <allan@archlinux.org>
#
# This PKGBUILD is maintained at https://github.com/ftalbrecht/aur
# in the gcc46 branch

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.6'
pkgname="gcc${_pkgver//./}"
pkgver="${_pkgver}.4"
#_islver='0.15'
#_cloogver='0.18.1'
pkgrel='4'
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'FDL' 'custom')
depends=('glibc' 'zlib' 'gmp' 'mpfr' 'elfutils')
makedepends=('binutils>=2.24' 'libmpc' 'texinfo')
#makedepends+=('ppl') # cloog
makedepends+=('flex' 'bison' 'aria2')
provides=("gcc-${_pkgver//\./}") # no version as it is completely contained in the name
# makedepends+=('dejagnu') # For test
#makedepends+=('gcc49')
conflicts=("gcc${_pkgver//\./}-multilib")
options=('staticlibs' '!libtool' '!buildflags')
options+=('!emptydirs')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #"http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  #"https://libisl.sourceforge.io/isl-${_islver}.tar.bz2"
  #"http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
  'gcc-hash-style-both.patch'
  'gcc_pure64.patch'
  'gcc.texi.49.patch'
)

md5sums=('b407a3d1480c11667f293bfb1f17d1a4'
         '4df25b623799b148a0703eaeec8fdf3f'
         '00b105ff3bc237381169d476c7f50cfb'
         'f3c42a9cfa840a062897da0468102771')
sha256sums=('35af16afa0b67af9b8eb15cafb76d2bc5f568540552522f5dc2c88dd45d977e8'
            '3492332fa78b545ff46c2b5293d17c63c122be6f8f6fa4798864b7d4572b0024'
            '0a6d182d91371d40820031b92e9aaca04e04afe48d89744d7b4fcac363f1f1b8'
            '9f8c50a715a921d3d2c9d5809ac9592ca66f682b2cc496606ff6eb4de79d46b6')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

prepare() {
  set -u
  cd "${_basedir}"

  # link isl/cloog for in-tree builds
  #ln -s "../isl-${_islver}" 'isl'
  #ln -s "../cloog-${_cloogver}" 'cloog'

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
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --disable-multilib
      --disable-werror
      --enable-__cxa_atexit
      --enable-checking='release'
      --enable-clocale='gnu'
      #--enable-cloog-backend='isl'
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
      #--with-cloog
      #--with-cloog-include='/usr/include/cloog-ppl'
      --with-plugin-ld='ld.gold'
      #--with-ppl # for cloog, requires ppl 0.11 to 0.99
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

package() {
  set -u
  cd "${_basedir}/gcc-build"

  LD_PRELOAD='/usr/lib/libstdc++.so' \
  make -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr/share/"

  # Move potentially conflicting stuff to version specific subdirectory
  $(ls "${pkgdir}"/usr/lib/gcc/${CHOST}/lib* 2&> /dev/null) && mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
