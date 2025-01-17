# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Vladislav Tyulbashev <vtyulb@vtyulb.ru>
# Contributor: 12qu <jrmcornish@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: mosra <mosra@centrum.cz>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.7'
pkgname="gcc${_pkgver//./}"
pkgver="${_pkgver}.4"
pkgrel='2'
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL-2.0-only' 'LGPL-2.1-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'GFDL-1.3-only' 'custom')
#groups=('base-devel')
depends=('glibc>=2.17' 'gcc-libs' 'bash' 'mpfr' 'binutils>=2.23' 'libmpc' 'cloog' 'ppl' 'zlib' 'libisl')
makedepends=('flex' 'bison' 'setconf')
#makedepends+=('gcc49')
checkdepends=('dejagnu')
options=('staticlibs' '!libtool' '!emptydirs' '!buildflags')
source=(
  "ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  #"ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2"
  'gcc.texi.49.patch'
  '0000-sourcebuild.texi-itemx.patch'
  '0001-tm.texi-end-deftypevr.patch'
  '0002-invoke.texi-tie.patch'
)
md5sums=('4c696da46297de6ae77a82797d2abe28'
         '1fb9648fbc183982542490cf8d5a9c58'
         '031d8f46e75b22771317d2fc9967953b'
         '9d546da082070fb7094a7b57a79d65b0'
         'a7664997b52919bc921e002ac1fe8022')
sha256sums=('92e61c6dc3a0a449e62d72a38185fda550168a86702dea07125ebd3ec3996282'
            '728cb6e732408eb9675eea793b55c0b073357dcd533c6fa9fc4acd8547650362'
            'b6c00e4dadf3a0180fc1db110b275768a8e0490a65182dc8e42fbcb639a28141'
            'f149493c2d8387b82ee6a6d9271e62a892e2276a1ebfcd0b725e10f187baed7b'
            '2628ce3cc0cd99150179e1efa0a7a2a659fd52d4e3e260147261d73d7efd0bc5')

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
  patch -Nup1 -i "${srcdir}/gcc.texi.49.patch"
  patch -Nup1 -i "${srcdir}/0000-sourcebuild.texi-itemx.patch"
  patch -Nup1 -i "${srcdir}/0001-tm.texi-end-deftypevr.patch"
  patch -Nup1 -i "${srcdir}/0002-invoke.texi-tie.patch"

  #cd ..; cp -pr "${_basedir}" 'a'; ln -s "${_basedir}" 'b'; false
  #diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

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

    #sed -e 's/BUILD_INFO=info/BUILD_INFO=/' -i 'gcc-4.7.4/gcc/configure'

    cd 'gcc-build'
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-build-poststage1-with-cxx
      --disable-build-with-cxx
      --disable-cloog-version-check
      --disable-libitm
      --disable-libmudflap
      --disable-libquadmath
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-libunwind-exceptions
      --disable-multilib
      --disable-ppl-version-check
      --enable-__cxa_atexit
      --enable-checking='release'
      --enable-clocale='gnu'
      --enable-cloog-backend='isl'
      --enable-gnu-unique-object
      --enable-gold
      --enable-languages='c,c++'
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
      --with-linker-hash-style='gnu'
      --with-plugin-ld='ld.gold'
      --with-ppl
      --with-system-zlib
      --prefix='/usr'
      #CXX='g++-4.9' CC='gcc-4.9'
      CXX='g++ -Wno-implicit-function-declaration -Wno-incompatible-pointer-types'
      CC='gcc -Wno-implicit-function-declaration -Wno-incompatible-pointer-types'
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
  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/" || true

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
