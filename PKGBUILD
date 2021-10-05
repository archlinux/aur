# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Florian Pritz <bluewind@xinu.at>

set -u
pkgname='lib32-libstdc++5'
pkgver='3.3.6'
pkgrel='8'
pkgdesc='Legacy GNU Standard C++ library version 3 (32 bit)'
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL' 'LGPL')
depends=('lib32-gcc-libs')
makedepends=('gcc-multilib' 'binutils' 'bash')
options=('!buildflags')
source=(
  "https://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-"{core,g++}"-${pkgver}.tar.bz2"
  'gcc-3.4.3-no_multilib_amd64.patch'
)
md5sums=('18c52e6fb8966b7700665dca289d077f'
         '6b3d00b8d079805be1b895f7f6ce47a0'
         '8504bb22dae9d49e8b6d70d7e6910f1b')
sha256sums=('4f9bee8ac57711508d6b8031d5ecfefc16fcf37ec81568b3f8344ef5f4cdfeb6'
            '7ee9fdf2771084c4933bb0a31d2fd9bfe8df746f9f47d76562b7a9e302a29d92'
            'dc2dc473071887ff6129c121950052398ed7c6fa1075ed839376030772068857')

prepare() {
  set -u
  cd "gcc-${pkgver}"

  # fix lib64 lib32 paths. During testing these folders were found to be wrong 
  # but since the patch isn't needed being wrong isn't wrong.
  patch -Nup1 -i "${srcdir}/gcc-3.4.3-no_multilib_amd64.patch"

  # Patches are the wrong way to do this
  sed -e '# gcc-3.4.6-ucontext.patch' \
      -e 's:\bstruct ucontext\b:ucontext_t:g' \
      -e '# siginfo.patch' \
      -e 's:\bstruct siginfo\b:siginfo_t:g' \
    -i $(grep --include 'linux*.h' -lrFe $'struct ucontext\nstruct siginfo' gcc/config/)

  # fix build issue with recent gcc
  sed -e "s#O_CREAT#O_CREAT, 0666#" -i 'gcc/collect2.c'
  # No fixincludes
  sed -e 's@\./fixinc\.sh@-c true@' \
      -e '# Clean up some warnings that arent our business' \
      -e 's:-Wstrict-prototypes::g' \
      -e 's:-Wtraditional::g' \
      -e 's:-pedantic::g' \
      -e 's:-Wall::g' \
    -i 'gcc/Makefile.in'
  sed -e 's:-Wall -Wtraditional -pedantic::g' -i 'libiberty/configure'

  # crtstuff.c as 32 bit including the hidden assembler code
  sed -e 's:^FLAGS_FOR_TARGET = :&-m32 -march=i686 -Wa,--32 :g' -i Makefile.{tpl,in}

  # Easiest way to convince the system it's running i686 without using configure --build --host
  sed -e 's:^UNAME_MACHINE=.*$:UNAME_MACHINE=i386:g' -i 'config.guess'
  set +u
}

build(){
  set -u

  #export CC="gcc -m32"
  #export CPP="cpp -m32"
  #export CXX="g++ -m32"
  # These must be export for all the configure inside make
  # Can't add any warning removal flags that xgcc doesn't support
  export CFLAGS='-march=i686 -m32 -O2 -pipe'
  export CPPFLAGS='-march=i686 -m32 -O2 -pipe'
  export CXXFLAGS='-march=i686 -m32 -O2 -pipe'
  export SHELL='/usr/bin/bash' # doesn't work with fish

  mkdir -p 'gcc-build'
  cd 'gcc-build'
  if [ ! -s 'Makefile' ]; then
    # https://www.linuxquestions.org/questions/slackware-14/explaining-build-host-target-509739/
    # Fixed by UNAME_MACHINE above
    local _copts=(
      #--build='i686-pc-linux-gnu'
      #--host='i686-pc-linux-gnu'
      --enable-__cxa_atexit \
      --enable-languages='c++' \
      --enable-multilib \
      --enable-shared \
      --enable-threads='posix' \
      --libdir='/usr/lib32' \
      --prefix='/usr'
    )
    ../gcc-${pkgver}/configure "${_copts[@]}"
  fi
  local _mflags=()
  if [ -z "${MAKEFLAGS:=}" ] || [ "${MAKEFLAGS//-j/}" = "${MAKEFLAGS}" ]; then
    local _nproc="$(nproc)"
    if [ "${_nproc}" -gt 8 ]; then
      _nproc=8
    fi
    _mflags+=('-j' "${_nproc}")
  fi
  # We build the full multilib libstdc++5 here, no idea how to restrict
  # the build process to the 32 bit version only.
  nice make 'all-target-libstdc++-v3' BOOT_CFLAGS="${CFLAGS}" STAGE1_CFLAGS='-O' "${_mflags[@]}"
  set +u
}

package() {
  set -u
  cd 'gcc-build'
  make DESTDIR="${pkgdir}" 'install-target-libstdc++-v3'

  # Only install the lib32 files
  rm -rf "${pkgdir}/usr"/{include,share,lib}
  rm -f "${pkgdir}/usr/lib32"/*.a
  rm -f "${pkgdir}/usr/lib32/libstdc++.so"
  set +u
}
set +u
