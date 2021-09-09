# Maintainer: Alexandros Theodotou <alex@zrythm.org>
# `libsmf` Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: foutrelis
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

_pkgbase=libsmf
pkgname=mingw-w64-libsmf
pkgver=1.3
pkgrel=3
pkgdesc='A BSD-licensed C library for handling SMF ("*.mid") files.'
arch=('x86_64')
url="https://sourceforge.net/projects/libsmf/"
license=('BSD')
depends=('mingw-w64-glib2')
makedepends=('mingw-w64-configure')
options=('!libtool' '!strip' '!buildflags' '!makeflags')
source=("https://downloads.sourceforge.net/project/${_pkgbase}/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha512sums=('3c383ec8f2fbe48ddab1008b3ecfe6941c38e33cfd963eabdf07f09c8c04c1b8758c8774b25672f70c29b570f2c250c795979d19b39c5027810b54b07035497d')

_architectures=('i686-w64-mingw32' 'x86_64-w64-mingw32')

build() {
  cd "${srcdir}"
  
  # fix for undefined reference to `rpl_malloc'
  export set ac_cv_func_malloc_0_nonnull=yes
  # fix for undefined reference to `rpl_realloc'
  export set ac_cv_func_realloc_0_nonnull=yes
  # fix for undefined reference to `_imp__ntohl@4'
  export LDFLAGS="${LDFLAGS} -lwsock32"
  
  for _arch in "${_architectures[@]}"; do
    rm -rf build-${_arch}
    cp -r "${_pkgbase}-${pkgver}" build-${_arch}
    pushd build-${_arch}

    ${_arch}-configure .
    make

    popd
  done
}

package() {
  cd "${srcdir}"

  for _arch in "${_architectures[@]}"; do
    pushd "build-${_arch}"

    make DESTDIR="${pkgdir}" install
    install -vDm644 COPYING "${pkgdir}/usr/$_arch/share/licenses/${_pkgbase}/LICENSE"

    popd
  done
}

