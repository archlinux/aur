# Maintainer: drakkan <nicola.murino at gmail dot com>

pkgname=mingw-w64-libpsl
_pkgname=libpsl
pkgver=0.21.2
pkgrel=3
pkgdesc='Public Suffix List library (mingw-w64)'
url='https://github.com/rockdaboot/libpsl'
arch=(any)
license=('MIT')
depends=('mingw-w64-libidn2' 'mingw-w64-libunistring')
makedepends=('mingw-w64-meson' 'gtk-doc')
source=(https://github.com/rockdaboot/libpsl/releases/download/${pkgver}/${_pkgname}-${pkgver}.tar.gz
  c47cf796.patch
  3dfe19d4578c361f800738c9c974d9c405801209.patch)
sha512sums=('f1df72220bf4391d4701007100b0df66c833a2cbcb7481c9d13f0b9e0cad3b66d2d15d4b976e5bad60d2ad1540355112fa1acb07aa925c241d2d7cd20681c71d'
  'a9b82a88c51abe86f10e65104b86afd345d992389fdbc4a7a71df632e2a3a1eb24f831103325e0d65205d081b9f6402864100a8f9b9b173e09e86f9d505f3355'
  '4f307e6a0dbd119c46de2f36d2121156ca785138e3e158b29bbc075ca7f177027ae11ed3c677c6a56f235ee1b8784cc9ea82db7569465ec76bc8dd8d71191832')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  patch -p1 -i ${srcdir}/c47cf796.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p "build-${_arch}" && pushd build-${_arch}
    ${_arch}-meson \
      -D docs=false \
      -D b_lto=false \
      -D runtime=libidn2 ..
    ninja
    popd
  done
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" ninja -C "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}" install
    if [[ $NO_EXECUTABLES ]]; then
      find "$pkgdir/usr/${_arch}" -name '*.exe' -delete
    fi
  done
}

# vim: ts=2 sw=2 et
