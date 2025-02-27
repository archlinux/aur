# Maintainer: Iaroslav Sorokin <iaroslav.sorokin@gmail.com>

pkgname=mingw-w64-pangomm
pkgver=2.56.1
pkgrel=1
pkgdesc="C++ bindings for Pango (mingw-w64)"
arch=('any')
url="https://www.gtkmm.org/"
license=('LGPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-pango' 'mingw-w64-glibmm' 'mingw-w64-cairomm' 'mm-common')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://download.gnome.org/sources/pangomm/${pkgver%.*}/pangomm-${pkgver}.tar.xz")
sha256sums=('539f5aa60e9bdc6b955bb448e2a62cc14562744df690258040fbb74bf885755d')
_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  CPPFLAGS+=" -D_REENTRANT"
  cd "${srcdir}/pangomm-$pkgver/"
  for _arch in ${_architectures}; do
    ${_arch}-meson --prefix /usr/${_arch} --libdir lib build-${_arch}
    pushd build-${_arch}
    ninja
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/pangomm-$pkgver/build-${_arch}"
    # make DESTDIR="${pkgdir}" install
    DESTDIR="${pkgdir}" ninja install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
