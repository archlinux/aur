# Maintainer: Andrew Kozik <andrewkoz at live dot com>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgname=mingw-w64-libressl-portable-git
pkgver=v2.1.3.r787.ga2befe3
pkgrel=1
_gitname=libressl-portable
pkgdesc="LibreSSL is an open-source implementation of the Transport Layer Security protocol (mingw-w64)"
arch=('any')
url="https://www.libressl.org"
license=('Apache 1.0' '4-clause BSD' 'ISC' 'public domain')
depends=()
makedepends=('mingw-w64-gcc'
             'perl')
options=('!strip' 'staticlibs' '!buildflags')
conflicts=('mingw-w64-openssl')
provides=('mingw-w64-openssl')

source=("${_gitname}::git+https://github.com/${_gitname}/portable/"
        "01-pthread.patch")

sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_gitname}"
  for _arch in $_architectures; do
    mkdir -p "${srcdir}/build-${_arch}"
    cp -a "${srcdir}/${_gitname}/"* "${srcdir}/build-${_arch}"
    cd "${srcdir}/build-${_arch}"
    ## Remove pthread shim code
    patch include/compat/pthread.h < ../../01-pthread.patch
    ./autogen.sh
    CC="${_arch}-gcc" CFLAGS="-pthread" CPPFLAGS="-D__MINGW_USE_VC2005_COMPAT"\
    ./configure --host=${_arch} --prefix=/usr/${_arch}
    make
    ## make check
  done
}

package() {
  cd "${srcdir}/${_gitname}"
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    DESTDIR="${pkgdir}" make install
  done
}
