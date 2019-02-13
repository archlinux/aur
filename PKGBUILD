# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.8.0
pkgrel=1
pkgdesc="VP8 and VP9 codec (mingw-w64)"
arch=('any')
url="http://www.webmproject.org/"
license=('BSD')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=v${pkgver}
        'configure.patch')
sha256sums=('SKIP'
            '24861b8d90eee9a5a953807b002ea05b86769df668b5a72a0b6e95f10969c3b6')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libvpx

  patch -Np1 < ../configure.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libvpx/build-${_arch} && cd ${srcdir}/libvpx/build-${_arch}

    unset EXTRA_CFLAGS

    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="x86-win32-gcc"
      EXTRA_CFLAGS="-mstackrealign"
    else
      _targetarch="x86_64-win64-gcc"
    fi

    CFLAGS="$EXTRA_CFLAGS $CFLAGS -fno-asynchronous-unwind-tables" CROSS="${_arch}-" ../configure \
        --prefix=/usr/${_arch} \
        --target=${_targetarch} \
        --disable-docs \
        --disable-install-docs \
        --disable-install-srcs \
        --enable-pic \
        --enable-postproc \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-vp8 \
        --enable-vp9 \
        --enable-vp9-highbitdepth \
        --enable-vp9-temporal-denoising

    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/libvpx/build-${_arch}
    make DIST_DIR="$pkgdir/usr/${_arch}" install

    #Move the hacked in shared libs to bin
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll ${pkgdir}/usr/${_arch}/bin/
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll.6* ${pkgdir}/usr/${_arch}/bin/

    #Install implib
    install -m 0644 ${srcdir}/libvpx/build-${_arch}/libvpx.dll.a ${pkgdir}/usr/${_arch}/lib/libvpx.dll.a

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
