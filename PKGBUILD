# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-libthai
pkgver=0.1.29
pkgrel=1
pkgdesc="Thai language support routines (mingw-w64)"
arch=('any')
url="https://linux.thai.net/projects/libthai"
license=('LGPL')
makedepends=('mingw-w64-configure' 'libdatrie' 'autoconf-archive')
depends=('mingw-w64-crt' 'mingw-w64-libdatrie')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://linux.thai.net/pub/thailinux/software/libthai/libthai-${pkgver}.tar.xz"
        'relocatable.patch')
sha256sums=('fc80cc7dcb50e11302b417cebd24f2d30a8b987292e77e003267b9100d0f4bcd'
            'f258c748e37a11ce20d307a9a27cf68de9543d79b7e60ebd31c7cf4398b5f6d9')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/libthai-${pkgver}"
  patch -Np1 -i "${srcdir}"/relocatable.patch
  autoreconf -fiv
}

build() {
  cd "${srcdir}/libthai-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/libthai-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
