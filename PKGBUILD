# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-gtkmm3
_pkgname=gtkmm3
pkgver=3.24.5
pkgrel=1
pkgdesc="C++ bindings for GTK+ 3 (mingw-w64)"
url="https://www.gtkmm.org/"
arch=('any')
license=('LGPL')
depends=('mingw-w64-gtk3' 'mingw-w64-pangomm' 'mingw-w64-atkmm')
makedepends=('mingw-w64-gcc' 'mingw-w64-meson' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/gtkmm/${pkgver%.*}/gtkmm-${pkgver}.tar.xz")
sha256sums=('856333de86689f6a81c123f2db15d85db9addc438bc3574c36f15736aeae22e6')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gtkmm-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LIBS+=" -lssp" \
    ${_arch}-meson \
    --buildtype=plain \
    --wrap-mode=nodownload \
    --default-library=both \
    --auto-features=enabled \
    -Dmaintainer-mode=false \
    -Dbuild-documentation=false \
    -Dbuild-demos=false \
    -Dbuild-tests=true \
    ..
    meson compile
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gtkmm-${pkgver}/build-${_arch}"
    DESTDIR="${pkgdir}" meson install
    find "${pkgdir}/usr/${_arch}" -name '*.def' -o -name '*.exp' | xargs -rtl1 rm
    ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
  done
}
