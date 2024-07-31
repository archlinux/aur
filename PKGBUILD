# Maintainer: Karl-Felix Glatzer <karl.glatzer@gmx.de>
pkgname=mingw-w64-libvpx
pkgver=1.14.1
pkgrel=1
pkgdesc="VP8 and VP9 codec (mingw-w64)"
arch=('any')
url="http://www.webmproject.org/"
license=('custom:BSD')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
makedepends=('mingw-w64-gcc' 'yasm' 'git')
_tag=12f3a2ac603e8f10742105519e0cd03c3b8f71dd
source=(git+https://chromium.googlesource.com/webm/libvpx#tag=${_tag}
        'configure.patch')
b2sums=('2ee22fba5822c0f3667c0c74de799536724ce88694b31e0493ce10c6f9a11c6ac563e39f5dcaf9fb4378346276610008dcbfc47f9407411b7c35ba4c71fb5f66'
        'fe5d0f5035cc872936010e6a3c24212da4ed5b0ba841e3271f8b419502bc251bae28b821fc4543021bf4d4594400b800796ddb993c443c881b98f59c0ae8a19e')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd libvpx

  git describe --tags | sed 's/^v//'
}

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

    #Move the hacked in shared libs to bin
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll ${pkgdir}/usr/${_arch}/bin/
    mv ${pkgdir}/usr/${_arch}/lib/libvpx.dll.9* ${pkgdir}/usr/${_arch}/bin/

    #Install implib
    install -m 0644 ${srcdir}/libvpx/build-${_arch}/libvpx.dll.a ${pkgdir}/usr/${_arch}/lib/libvpx.dll.a

    ${_arch}-strip -s ${pkgdir}/usr/${_arch}/bin/*.exe
    ${_arch}-strip -g --strip-unneeded ${pkgdir}/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g ${pkgdir}/usr/${_arch}/lib/*.a
  done

  cd ${srcdir}/libvpx

  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}

# vim: ts=2 sw=2 et:
