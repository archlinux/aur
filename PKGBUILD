# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.6.1
pkgrel=2
pkgdesc="VP8 and VP9 codec (mingw-w64)"
arch=('any')
url="http://www.webmproject.org/"
license=('BSD')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
source=(libvpx-$pkgver.tar.gz::https://github.com/webmproject/libvpx/archive/v$pkgver.tar.gz
        'configure.patch')
sha256sums=('cda8bb6f0e4848c018177d3a576fa83ed96d762554d7010fe4cfb9d70c22e588'
            '73ffee7c361682e6483b2209b2a55887c29c23174b994229bbe0642e09214093')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libvpx-$pkgver

  patch -Np1 < ../configure.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libvpx-$pkgver/build-${_arch} && cd ${srcdir}/libvpx-$pkgver/build-${_arch}

    unset EXTRA_CFLAGS

    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="x86-win32-gcc"
      EXTRA_CFLAGS="-mstackrealign"
    else
      _targetarch="x86_64-win64-gcc"
    fi

    CFLAGS="$EXTRA_CFLAGS $CFLAGS" CROSS="${_arch}-" ../configure \
        --prefix=/usr/${_arch} \
        --target=${_targetarch} \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-pic \
        --disable-examples \
        --disable-docs \
        --disable-install-bins \
        --disable-install-docs \
        --disable-install-srcs \
        --enable-vp8 \
        --enable-postproc \
        --enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-experimental \
        --enable-spatial-svc

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libvpx-$pkgver/build-${_arch}
    make DIST_DIR="$pkgdir/usr/${_arch}" install

    #Move the hacked in shared libs to bin
    mkdir ${pkgdir}/usr/${_arch}/bin
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll ${pkgdir}/usr/${_arch}/bin/
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll.4* ${pkgdir}/usr/${_arch}/bin/

    #Install implib
    install -m 0644 ${srcdir}/libvpx-$pkgver/build-${_arch}/libvpx.dll.a ${pkgdir}/usr/${_arch}/lib/libvpx.dll.a

    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
