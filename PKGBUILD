# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Vlad-Mihai Sima <vladmihaisima@yahoo.com>
# Contributor: Carson Reynolds <carson@k2.t.u-tokyo.ac.jp>
# Contributor: Mikhail Vorozhtsov <mikhail.vorozhtsov@gmail.com>
# Contributor: Wolf Ramovsky <wolf.ramovsky@gmail.com>
# Contributor: kristianlm2 <kristanlein@gmail.com>
# Contributor: progtologist <arissynod@gmail.com>
# Contributor: pelluch <pablo.lluch@gmail.com>

set -u
_pkgver='4.4'
pkgname="gcc${_pkgver//\./}"
pkgver="${_pkgver}.7"
pkgrel='6'
pkgdesc="The GNU Compiler Collection (${_pkgver}.x)"
arch=('x86_64' 'i686')
url='http://gcc.gnu.org/'
license=('GPL' 'LGPL' 'custom')
depends=('binutils' 'mpfr' 'cloog' 'zlib' 'elfutils')
makedepends=('setconf')
#makedepends+=('gcc49')
conflicts=("gcc${_pkgver//\./}-multilib")
options=('staticlibs' '!libtool' '!buildflags')
source=(
  "http://www.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
  'gcc-hash-style-both.patch'
  'gcc_pure64.patch'
  'siginfo_t_fix.patch'
  '0000-gcc-c11-toplev.diff::https://www.rockbox.org/gcc/gcc-c11-toplev.diff'
)
md5sums=('295709feb4441b04e87dea3f1bab4281'
         '6fd395bacbd7b6e47c7b74854b478363'
         '4030ee1c08dd1e843c0225b772360e76'
         'eba17a209cf9550b66a4af0527956565'
         'ea3bba5ee50ba043b992eaa22161e141')
sha256sums=('5ff75116b8f763fa0fb5621af80fc6fb3ea0f1b1a57520874982f03f26cd607f'
            'a600550d3d2b2fb8ee6a547c68c3a08a2af7579290b340c35ee5598c9bb305a5'
            '2d369cf93c6e15c3559c3560bce581e0ae5f1f34dc86bca013ac67ef1c1a9ff9'
            '4df866dcfd528835393d2b6897651158faf6d84852158fbf2e4ffc113ec7d201'
            'aa81059bc71f335c962db6bbb8c5857a5cc76e2eb33b82ce1ccd6cb536b2bc31')

if [ -n "${_snapshot:-}" ]; then
  _basedir="gcc-${_snapshot}"
else
  _basedir="gcc-${pkgver}"
fi

#_libdir="usr/lib/gcc/${CHOST}/${pkgver}"

prepare() {
  set -u
  cd "${_basedir}"

  # Do not install libiberty
  sed -e 's/install_to_$(INSTALL_DEST) //' -i 'libiberty/Makefile.in'

  # Do not run fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' -i 'gcc/Makefile.in'

  patch -Np0 -i "${srcdir}/gcc-hash-style-both.patch"

  patch -Np1 -i "${srcdir}/siginfo_t_fix.patch"

  patch -Np1 -i "${srcdir}/0000-gcc-c11-toplev.diff"

  case "${CARCH}" in
  'x86_64') patch -Np1 -i '../gcc_pure64.patch';;
  esac

  # fix build with glibc 2.26
  sed -e 's:\bstruct ucontext\b:ucontext_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct ucontext\b')
  sed -e 's:\bstruct sigaltstack\b:stack_t:g' -i $(grep --include '*.[ch]' --include '*.cc' -lre '\bstruct sigaltstack\b')

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

    cd 'gcc-build'
    # The following options are one per line, mostly sorted so they are easy to diff compare to other gcc packages.
    local _conf=(
      --build="${CHOST}"
      --disable-libmudflap
      --disable-libssp
      --disable-libstdcxx-pch
      --disable-multilib
      --enable-__cxa_atexit
      --enable-clocale='gnu'
      --enable-languages='c,c++,fortran,objc,obj-c++'
      --enable-libgomp
      --enable-shared
      --enable-threads='posix'
      --enable-version-specific-runtime-libs
      --infodir='/usr/share/info'
      --libdir='/usr/lib'
      --libexecdir='/usr/lib'
      --mandir='/usr/share/man'
      --program-suffix="-${_pkgver}"
      --with-cloog
      --with-ppl
      --with-system-zlib
      --with-tune='generic'
      --prefix='/usr'
      #CXX='g++-4.9' CC='gcc-4.9'
    )
    ../configure "${_conf[@]}"

    sed -e 's/^STAGE1_CXXFLAGS.*$/& -std=gnu++11/' -i 'Makefile'
  fi

  #LD_PRELOAD='/usr/lib/libstdc++.so' \\
  nice make -s

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

  mv "${pkgdir}/usr/lib/gcc/${CHOST}"/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Create links for gcc build environment (useful for CUDA)
  mkdir -p "${pkgdir}/opt/gcc-${_pkgver}"
  ln -s "/usr/bin/gcc-${_pkgver}" "${pkgdir}/opt/gcc-${_pkgver}/gcc"
  ln -s "/usr/bin/g++-${_pkgver}" "${pkgdir}/opt/gcc-${_pkgver}/g++"

  # Avoid file conflicts when enabling libgomp
  rm -rf "${pkgdir}/usr/share/info"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
    "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION" || :
  set +u
}
set +u
