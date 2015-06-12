# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-recode
pkgver=3.6
pkgrel=10
pkgdesc="Converts files between various character sets and usages (mingw-w64)"
arch=('any')
url="http://recode.progiciels-bpi.ca/index.html"
license=('GPL' 'LGPL')
depends=('mingw-w64-crt' 'mingw-w64-gettext')
options=('!strip' '!buildflags' 'staticlibs')
makedepends=('mingw-w64-gcc')
source=(recode-${pkgver}.tar.gz::"https://github.com/pinard/recode/tarball/v${pkgver}"
        'http://ftp.de.debian.org/debian/pool/main/r/recode/recode_3.6-17.diff.gz'
        'recode-3.6-as-if.patch' 'recode-3.6-gettextfix.diff' 'autotools.patch' 'mingw.patch')
md5sums=('f82e9a6ede9119268c13493c9add2809'
         '3716ae269074e31add3d29387ff09438'
         'fca7484ba332c8ad59eb02334883cd92'
         'eb602e80a24b5448604bfebeacc55304'
         '8680ae965cdcd26f0dea1b8f85c34226'
         '515d43fe361a44f576fea310f85472ae')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/pinard-Recode-2127b34
  patch -Np1 -i ${srcdir}/recode-3.6-as-if.patch
  patch -Np1 -i ${srcdir}/recode-3.6-gettextfix.diff
  patch -Np1 -i ${srcdir}/recode_3.6-17.diff
  patch -Np1 -i ${srcdir}/autotools.patch
  patch -Np1 -i ${srcdir}/mingw.patch
  sed -i '1i#include <stdlib.h>' src/argmatch.c
  sed -i -e '/^AM_C_PROTOTYPES/d' -e '/^AUTOMAKE_OPTIONS.*ansi2knr/d' \
  configure.in src/Makefile.am
  rm -f acinclude.m4
  autoreconf -fi
  libtoolize
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
    unset LDFLAGS CPPFLAGS
    export ac_cv_func_malloc_0_nonnull=yes
    export jm_cv_func_working_malloc=yes
    export jm_cv_func_working_realloc=yes
    ${srcdir}/pinard-Recode-2127b34/configure --prefix=/usr/${_arch} --host=${_arch} \
      --mandir=/usr/${_arch}/share/man \
      --infodir=/usr/${_arch}/share/info --without-included-gettext
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DESTDIR="${pkgdir}" install

    rm -r "${pkgdir}/usr/${_arch}/share"
    rm "${pkgdir}/usr/${_arch}"/bin/*.exe

    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}"/bin/*.dll
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}"/lib/*.a
  done
}
