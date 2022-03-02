# -*- mode: Shell-script; eval: (setq indent-tabs-mode nil); eval: (setq tab-width 2) -*-
# Maintainer: Dominic Meiser <git at msrd0 dot de>
# Contributor: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libjpeg-turbo-static
pkgver=2.1.3
pkgrel=1
arch=(any)
pkgdesc="JPEG image codec with accelerated baseline compression and decompression (mingw-w64)"
license=("custom")
depends=(mingw-w64-crt)
makedepends=(yasm mingw-w64-cmake ninja)
provides=(mingw-w64-libjpeg{,-turbo})
conflicts=(mingw-w64-libjpeg mingw-w64-libjpeg{,6}-turbo)
options=(staticlibs !strip !buildflags)
url="https://libjpeg-turbo.org/"
source=("http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-$pkgver.tar.gz"{,.sig})
validpgpkeys=('0338C8D8D9FDA62CF9C421BD7EC2DBB6F4DBF434') # The libjpeg-turbo Project (Signing key for official binaries) <information@libjpeg-turbo.org>
sha512sums=('975c9835de7d70c6c8c5a1959adfa18f7f956bc9946fde8f1b40c1d853245c38a3118ac06b93841ec3e90be6945c38d687d062b371496c2ee9b5638d7f60418d'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/libjpeg-turbo-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -G Ninja -DENABLE_SHARED=OFF -DWITH_JPEG8=ON ..
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/libjpeg-turbo-$pkgver/build-${_arch}"
    DESTDIR="$pkgdir" ninja install
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    if [[ $NO_EXECUTABLES ]]; then
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -delete
    else
      find "${pkgdir}/usr/${_arch}" -name '*.exe' -exec ${_arch}-strip --strip-all {} \;
    fi
  done
}
