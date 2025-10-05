# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.15.2
pkgrel=1
pkgdesc="VP8 and VP9 codec (mingw-w64)"
arch=('any')
url="http://www.webmproject.org/"
license=('custom:BSD')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs !debug)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
_tag=9aec918bf47611de2ffc7df61624c3d1b58be4ec
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag}
        # patches from MSYS2 (https://github.com/msys2/MINGW-packages/tree/master/mingw-w64-libvpx)
        '0001-enable-shared-on.mingw.patch'
        '0005-fix-exports.mingw.patch')
b2sums=('7dac94f25867bf023b5d15662996f867e435533b038da881352730b88f8fc9ae657c45b17c135579c3e4bd4039f450cb4f7e5e3e3f2738c68e230f901f7c6456'
        '717394b571a5fa8325cd64092886e2f013facde7bea08aef4f8361e97e10fd2c9ffc93ab8d070ab2f16e994766206e9ba39e793b7852e5b70f426b50fb9e63f1'
        '89024d854bf3fd514b2c219f133f2fc82bdab22158b74da90053c3a3812c148f6b43e7061d179ab8dbc0e6c441a23f95499a00180fb52b20effb9ba2504f00a8')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd libvpx

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd ${srcdir}/libvpx

  patch -Np1 -i "${srcdir}/0001-enable-shared-on.mingw.patch"
  patch -Np1 -i "${srcdir}/0005-fix-exports.mingw.patch"
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
        --disable-unit-tests \
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

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done

  cd ${srcdir}/libvpx

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
