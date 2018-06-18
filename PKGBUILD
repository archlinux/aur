# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-cairomm
pkgver=1.12.2
pkgrel=1
pkgdesc="C++ bindings for Cairo (mingw-w64)"
arch=('any')
url="https://www.cairographics.org/cairomm/"
license=('LGPL' 'MPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-cairo' 'mingw-w64-libsigc++')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://www.cairographics.org/releases/cairomm-${pkgver}.tar.gz")
md5sums=('9d2282ea34cf9aaa89208bb4bb911909')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  CPPFLAGS+=" -D_REENTRANT -D_POSIX_SOURCE"
  export lt_cv_deplibs_check_method='pass_all'
  cd "${srcdir}/cairomm-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
    --disable-documentation \
    ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/cairomm-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
