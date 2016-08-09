# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.6.0
pkgrel=1
pkgdesc="VP8 and VP9 codec (mingw-w64)"
arch=('any')
url="http://www.webmproject.org/"
license=('BSD')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
source=(libvpx-$pkgver.tar.gz::https://github.com/webmproject/libvpx/archive/v$pkgver.tar.gz
        'configure.patch')
sha256sums=('e2fc00c9f60c76f91a1cde16a2356e33a45b76a5a5a1370df65fd57052a4994a'
            '73ffee7c361682e6483b2209b2a55887c29c23174b994229bbe0642e09214093')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libvpx-$pkgver

  patch -Np1 < ../configure.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/libvpx-$pkgver/build-${_arch} && cd ${srcdir}/libvpx-$pkgver/build-${_arch}
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="x86-win32-gcc"
    else
      _targetarch="x86_64-win64-gcc"
    fi

    CROSS="${_arch}-" ../configure \
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

    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
