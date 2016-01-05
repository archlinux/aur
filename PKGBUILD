# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Christian Babeux <christian.babeux@0x80.ca>
# Contributor: Tianjiao Yin <ytj000(at)gmail(dot)(see)(oh)(em)>
# Contributor: Allan McRae <allan@archlinux.org>

set -u
pkgname='gcc45'
pkgver='4.5.4'
pkgrel='3'
pkgdesc='The GNU Compiler Collection (4.5.x)'
arch=('i686' 'x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL' 'custom')
depends=('glibc' 'binutils' 'gmp' 'mpfr' 'libmpc' 'ppl' 'isl' 'cloog' 'elfutils')
makedepends=('flex' 'bison' 'setconf' 'gcc49') # gcc48 also works if you change -4.9 below
conflicts=('gcc45-multilib')
options=('!libtool' '!buildflags' 'staticlibs')
source=("http://www.mirrorservice.org/sites/sourceware.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        'gcc-hash-style-both.patch'
        'gcc_pure64.patch')

sha256sums=('eef3f0456db8c3d992cbb51d5d32558190bc14f3bc19383dd93acc27acc6befc'
            'a600550d3d2b2fb8ee6a547c68c3a08a2af7579290b340c35ee5598c9bb305a5'
            '2d369cf93c6e15c3559c3560bce581e0ae5f1f34dc86bca013ac67ef1c1a9ff9')

prepare() {
  set -u
  cd "gcc-${pkgver}"

  # Do not install libiberty
  sed -i -e 's:install_to_$(INSTALL_DEST) ::' 'libiberty/Makefile.in'

  # Do not run fixincludes
  sed -i -e 's:\./fixinc\.sh:-c true:' 'gcc/Makefile.in'

  patch -Np0 -i "${srcdir}/gcc-hash-style-both.patch"

  case "${CARCH}" in
  'x86_64') patch -Np1 -i "${srcdir}/gcc_pure64.patch"; false;;
  esac

  echo "${pkgver}" > 'gcc/BASE-VER'

  setconf 'gcc/configure' 'BUILD_INFO' ''

  rm -rf 'build'
  mkdir 'build'
  cd 'build'

  ../configure \
      --prefix='/usr' \
      --mandir='/usr/share/man' \
      --infodir='/usr/share/info' \
      --libdir='/usr/lib' \
      --libexecdir='/usr/lib' \
      --program-suffix='-4.5' \
      --enable-shared \
      --enable-languages='c,c++,fortran,objc,obj-c++' \
      --enable-__cxa_atexit \
      --disable-libstdcxx-pch \
      --disable-multilib \
      --disable-libgomp \
      --disable-libmudflap \
      --disable-libssp \
      --enable-clocale='gnu' \
      --with-tune='generic' \
      --with-cloog \
      --with-ppl \
      --with-system-zlib \
      CXX='g++-4.9' CC='gcc-4.9'
  set +u
}

build() {
  set -u
  cd "gcc-${pkgver}"
  local _nproc="$(nproc)"; _nproc=$((_nproc>8?8:_nproc))
  make -j "${_nproc}"
  set +u
}

package() {
  set -u
  cd "gcc-${pkgver}/build"

  make install DESTDIR="${pkgdir}"
  rm -rf "${pkgdir}/usr/share/man/man7"
  rm -rf "${pkgdir}/usr/share/locale"
  mv "${pkgdir}"/usr/lib/lib* "${pkgdir}/usr/lib/gcc/${CHOST}/${pkgver}/"

  # Install Runtime Library Exception
  install -Dpm644 '../COPYING.RUNTIME' \
      "${pkgdir}/usr/share/licenses/${pkgname}/RUNTIME.LIBRARY.EXCEPTION"

  # Create links for gcc-4.5 build environment (useful for CUDA)
  mkdir -p "${pkgdir}/opt/gcc-4.5"
  ln -s '/usr/bin/gcc-4.5' "${pkgdir}/opt/gcc-4.5/gcc"
  ln -s '/usr/bin/g++-4.5' "${pkgdir}/opt/gcc-4.5/g++"
  set +u
}
set +u
