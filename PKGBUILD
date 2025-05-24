# Maintainer: Miro Kropacek <miro.kropacek@gmail.com>
# Contributor: Florian Pritz <bluewind@archlinux.at>
# Contributor: Chris Severance aur.severach aATt spamgourmet dott com

set -u
pkgname='libstdc++5'
pkgver='3.3.6'
pkgrel='11'
pkgdesc='Legacy GNU Standard C++ library version 3'
arch=('x86_64')
url='http://gcc.gnu.org'
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('gcc' 'binutils' 'bash')
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
  #patch -Nup1 -i "${srcdir}/gcc-3.4.3-no_multilib_amd64.patch"
  local _pt
  for _pt in "${source[@]%%::*}"; do
    _pt="${_pt##*/}"
    if [[ "${_pt}" = *.patch ]]; then
      set +u; msg2 "Patch ${_pt}"; set -u
      patch -Nup1 -i "${srcdir}/${_pt}"
    fi
  done
  #cd ..; cp -pr "gcc-${pkgver}" 'a'; ln -s "gcc-${pkgver}" 'b'; false
  # diff -pNaru5 'a' 'b' > "0000-$RANDOM.patch"

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

  set +u
}

build(){
  set -u

  export CFLAGS="-march=${CARCH/_/-} -O1"
  export CPPFLAGS="${CFLAGS}"
  export CXXFLAGS="${CFLAGS}"
  export SHELL='/usr/bin/bash' # doesn't work with fish

  mkdir -p 'gcc-build'
  cd 'gcc-build'
  if [ ! -s 'Makefile' ]; then
    local _copts=(
      --enable-__cxa_atexit
      --enable-languages='c++'
      --disable-multilib
      --enable-shared
      --enable-threads='posix'
      --libdir='/usr/lib'
      --prefix='/usr'
    )
    export CC='gcc -std=gnu99 -Wno-implicit-int -Wno-implicit-function-declaration -Wno-incompatible-pointer-types -Wno-int-conversion' # https://gcc.gnu.org/gcc-14/porting_to.html
    ../gcc-${pkgver}/configure "${_copts[@]}"
  fi
  # We build the full multilib libstdc++5 here, no idea how to restrict
  # the build process to the 32 bit version only.
  nice make 'all-target-libstdc++-v3' BOOT_CFLAGS="${CFLAGS}" STAGE1_CFLAGS='-O'
  set +u
}

package() {
  set -u
  cd 'gcc-build'
  make DESTDIR="${pkgdir}" 'install-target-libstdc++-v3'

  # Remove includefiles and libs provided by gcc
  rm -rf "${pkgdir}/usr"/{include,share}
  rm -f "${pkgdir}/usr/lib"/*.a
  rm -f "${pkgdir}/usr/lib/libstdc++.so"
  set +u
}
set +u
