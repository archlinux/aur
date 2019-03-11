# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Tianjiao Yin <ytj000(at)gmail(dot)(see)(oh)(em)>
# Contributor: Allan McRae <allan@archlinux.org>

set -u
_pkgver='4.5'
pkgname="gcc${_pkgver//\./}"
pkgver="${_pkgver}.4"
_islver='0.12.2'
_cloogver='0.18.1'
pkgrel='3'
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'custom')
depends=('glibc' 'binutils' 'gmp' 'mpfr' 'libmpc' 'ppl' 'elfutils') #'isl' 'cloog' 
makedepends=('flex' 'bison' 'setconf')
#makedepends+=('gcc49')
conflicts=("gcc${_pkgver//\./}-multilib")
options=('staticlibs' '!libtool')
source=(
  "http://www.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  "http://isl.gforge.inria.fr/isl-${_islver}.tar.bz2"
  "http://www.bastoul.net/cloog/pages/download/cloog-${_cloogver}.tar.gz"
  'gcc-hash-style-both.patch'
  'gcc_pure64.patch'
)
sha256sums=('eef3f0456db8c3d992cbb51d5d32558190bc14f3bc19383dd93acc27acc6befc'
            'f4b3dbee9712850006e44f0db2103441ab3d13b406f77996d1df19ee89d11fb4'
            '02500a4edd14875f94fe84cbeda4290425cb0c1c2474c6f75d75a303d64b4196'
            'a600550d3d2b2fb8ee6a547c68c3a08a2af7579290b340c35ee5598c9bb305a5'
            '2d369cf93c6e15c3559c3560bce581e0ae5f1f34dc86bca013ac67ef1c1a9ff9')
PKGEXT='.pkg.tar.gz'

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

  # Do not install libiberty
  sed -e 's/install_to_$(INSTALL_DEST) //' -i 'libiberty/Makefile.in'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  patch -Np0 -i "${srcdir}/gcc-hash-style-both.patch"

  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')

  case "${CARCH}" in
  'x86_64') patch -Np1 -i '../gcc_pure64.patch';;
  esac

  echo "${pkgver}" > 'gcc/BASE-VER'

  setconf 'gcc/configure' 'BUILD_INFO' ''

  rm -rf 'gcc-build'
  mkdir 'gcc-build'

  set +u
}

build() {
  set -u
  if [ ! -s "${_basedir}/gcc-build/Makefile" ]; then
    cd "${_basedir}"

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
      --disable-libgomp \
      --disable-libmudflap \
      --disable-libssp \
      --disable-libstdcxx-pch \
      --disable-multilib \
      --enable-__cxa_atexit \
      --enable-clocale='gnu' \
      --enable-cloog-backend='isl' \
      --enable-languages='c,c++,fortran,objc,obj-c++' \
      --enable-shared \
      --enable-version-specific-runtime-libs \
      --infodir='/usr/share/info' \
      --libdir='/usr/lib' \
      --libexecdir='/usr/lib' \
      --mandir='/usr/share/man' \
      --program-suffix="-${_pkgver}" \
      --with-cloog \
      --with-ppl \
      --with-system-zlib \
      --with-tune='generic' \
      --prefix='/usr'
#      CXX='g++-4.9' CC='gcc-4.9'
  fi

  cd "${srcdir}/${_basedir}/gcc-build"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "${_basedir}/gcc-build"

  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  make -j1 DESTDIR="${pkgdir}" install

  ## Lazy way of dealing with conflicting man and info pages and locales...
  rm -rf "${pkgdir}/usr/share/man/man7"
  rm -rf "${pkgdir}/usr/share/locale"
  rmdir "${pkgdir}/usr/include" "${pkgdir}/usr/share/info"

  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Create links for gcc build environment (useful for CUDA)
  mkdir -p "${pkgdir}/opt/gcc-${_pkgver}"
  ln -s "/usr/bin/gcc-${_pkgver}" "${pkgdir}/opt/gcc-${_pkgver}/gcc"
  ln -s "/usr/bin/g++-${_pkgver}" "${pkgdir}/opt/gcc-${_pkgver}/g++"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
