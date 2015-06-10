# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.4.0
pkgrel=1
pkgdesc="VP8 and VP9 codec (mingw-w64)"
arch=('any')
url="http://www.webmproject.org/"
license=('BSD')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
source=(libvpx::git+http://code.google.com/p/webm.libvpx#tag=v$pkgver
        'configure.patch'
        'mingwstrtok.patch')
md5sums=('SKIP'
         '3eda3d2e433469458b3e4767ac1d722f'
         '15da30a2ad44c8934ec52ea6b28ff156')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd ${srcdir}/libvpx

  patch -Np1 < ../configure.patch
  patch -Np1 < ../mingwstrtok.patch
}

build() {
  for _arch in ${_architectures}; do
    mkdir -p ${srcdir}/build-${_arch} && cd ${srcdir}/build-${_arch}
    if [ ${_arch} = "i686-w64-mingw32" ]; then
      _targetarch="x86-win32-gcc"
    else
      _targetarch="x86_64-win64-gcc"
    fi

    unset LDFLAGS CPPFLAGS
    CROSS="${_arch}-" ${srcdir}/libvpx/configure --prefix="/usr/${_arch}" \
        --target=${_targetarch} \
        --enable-vp8 \
        --enable-vp9 \
        --enable-runtime-cpu-detect \
        --enable-shared \
        --enable-postproc \
        --enable-pic \
        --disable-examples \
        --disable-docs \
        --disable-install-bins \
        --disable-install-docs \
        --disable-install-srcs
    make
  done
}

package() {
  for _arch in ${_architectures}; do
    cd ${srcdir}/build-${_arch}
    make DIST_DIR="$pkgdir/usr/${_arch}" install

    #Move the hacked in shared libs to bin
    mkdir ${pkgdir}/usr/${_arch}/bin
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll ${pkgdir}/usr/${_arch}/bin/
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll.2* ${pkgdir}/usr/${_arch}/bin/

    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done
}
