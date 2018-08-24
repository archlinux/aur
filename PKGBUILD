# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.7.0
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
sha256sums=('1fec931eb5c94279ad219a5b6e0202358e94a93a90cfb1603578c326abfc1238'
            'b05b7539a3e593deec07cba431d4ca17554cf98f622571b902b954e987800307')
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

    CFLAGS="$EXTRA_CFLAGS $CFLAGS -fno-asynchronous-unwind-tables" CROSS="${_arch}-" ../configure \
        --prefix=/usr/${_arch} \
        --target=${_targetarch} \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-pic \
        --disable-docs \
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
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll ${pkgdir}/usr/${_arch}/bin/
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll.5* ${pkgdir}/usr/${_arch}/bin/

    #Install implib
    install -m 0644 ${srcdir}/libvpx-$pkgver/build-${_arch}/libvpx.dll.a ${pkgdir}/usr/${_arch}/lib/libvpx.dll.a

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
