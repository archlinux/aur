# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-zziplib
pkgver=0.13.71
pkgrel=1
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file (mingw-w64)"
arch=(any)
url="http://zziplib.sourceforge.net"
license=("LGPL, MPL")
makedepends=('mingw-w64-configure' 'mingw-w64-sdl' 'python' 'xmlto' 'zip')
depends=('mingw-w64-crt' 'mingw-w64-zlib')
optdepends=("mingw-w64-sdl: SDL_rwops for ZZipLib")
options=(staticlibs !strip !buildflags)
source=("zziplib-${pkgver}.tar.gz"::"https://github.com/gdraheim/zziplib/archive/v${pkgver}.tar.gz"
        "configure.patch")
sha256sums=('2ee1e0fbbb78ec7cc46bde5b62857bc51f8d665dd265577cf93584344b8b9de2'
            '892162a8535575891663607b8fb5e3be518e8293e9b0f22cf437b1d83a58b008')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/zziplib-${pkgver}"
  patch -Np1 -i ${srcdir}/configure.patch
  autoreconf -fiv
}

build() {
  cd "${srcdir}/zziplib-${pkgver}"
  for _arch in ${_architectures}; do
    export PYTHON=/usr/bin/python
    export PERL=/usr/bin/perl
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --with-zlib=/usr/${_arch} \
      --enable-sdl \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/zziplib-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -rf "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -rf "$pkgdir/usr/${_arch}/share"
  done
}
