# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Piotr "utak3r" Borys <piotr.borys@gmail.com>
# Contributor: Giovanni "ItachiSan" Santini <giovannisantini93@yahoo.it>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

set -u
_pkgver='4.4'
pkgname="gcc${_pkgver//\./}"
pkgname+='-multilib'
pkgver="${_pkgver}.7"
pkgrel='4'
_libstdcppmanver=4.5.2 # Note: check source directory name when updating this
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
pkgdesc+=" - multilib version"
arch=('x86_64' 'i686')
url='http://gcc.gnu.org/'
license=('GPL-2.0-only' 'LGPL-2.1-only' 'GPL-3.0-only' 'LGPL-3.0-only' 'custom')
depends=('glibc' 'lib32-glibc' 'gcc-libs' 'lib32-gcc-libs' 'gmp' 'bash' 'binutils' 'mpfr' 'zlib')
makedepends=('binutils>=2.21' 'libmpc' 'cloog' 'elfutils' 'dejagnu' 'glibc>=2.11.1-2' 'lib32-glibc>=2.12.1')
conflicts=('gcc44')  # Existing package from AUR
provides=("gcc44=${pkgver}")
options=('staticlibs' '!libtool' '!buildflags' '!emptydirs')
source=(
  # ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2 <- the one over is 'optimized',
  # it chooses the right mirror for you
  #"http://ftpmirror.gnu.org/gcc/gcc-${pkgver}/gcc-{core,g++}-${pkgver}.tar.bz2"
  "http://www.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  # If you have problems, use the source below
  # http://ftp.vim.org/languages/gcc/libstdc++/doxygen/libstdc++-api-${_libstdcppmanver}.man.tar.bz2
  #"ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-api-${_libstdcppmanver}.man.tar.bz2" # can't be automagically resolved, doh
  # Various patches
  'gcc_pure64.patch'
  'gcc-hash-style-both.patch'
  'siginfo_t_fix.patch'
  'texinfo_5_fix.patch'
  'gcc-fix_toplevel_inlines.patch'
)
md5sum=(x)
sha256sums=('5ff75116b8f763fa0fb5621af80fc6fb3ea0f1b1a57520874982f03f26cd607f'
            '59d7a0b897e0a6e4e126319d2c4db770fe4531e5700bb7c320f0075935078204'
            'a600550d3d2b2fb8ee6a547c68c3a08a2af7579290b340c35ee5598c9bb305a5'
            '24cb033fa363148952b5ed7cdff635fbee0ae55ecafe5dfa32206e97cb0c4af3'
            '4f4d16d98d72c29ebccdda6a89d65fcd9357703c97c3fca65080ae3e7add762c'
            '9a43d0dfb398dc0dd42f05059718dc5ee9ab8bcf7eaf5234e420f5d3ceb8c8c5')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  set -u
  cd "${_basedir}"

  # "Add" ppl-0.11 compatibility
  sed -e "/ppl_minor_version=/s#10#11#" -i 'configure'

  # Do not install libiberty
  sed -e 's/install_to_$(INSTALL_DEST) //' -i 'libiberty/Makefile.in'

  # Do not run fixincludes
  #sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  patch -Np0 -i "${srcdir}/gcc-hash-style-both.patch"

  patch -Np1 -i "${srcdir}/siginfo_t_fix.patch"

  patch -Np1 -i "${srcdir}/gcc-fix_toplevel_inlines.patch"

  patch -Np1 -i "${srcdir}/texinfo_5_fix.patch"

  case "${CARCH}" in
  'x86_64') patch -Np1 -i '../gcc_pure64.patch';;
  esac

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
      --enable-multilib
      --disable-libunwind-exceptions
      --disable-werror
      --enable-checking='release'
      --enable-__cxa_atexit
      --enable-clocale='gnu'
      --enable-cloog-backend='isl'
      --enable-gnu-unique-object
      --enable-gold
      --enable-languages='c,c++'
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
      #--with-bugurl='https://github.com/ItachiSan/linux_packaging/issues/'
      --with-cloog
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

  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -s

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  # ulimit -s 32768

  # do not abort on error as some are "expected"
  # make -k check || true
  # ${_basedir}/contrib/test_summary
  set +u
}

# Used the same package() as gcc45 (AUR).
package() {
  set -u
  cd "${_basedir}/gcc-build"

  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  make -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr/share/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
