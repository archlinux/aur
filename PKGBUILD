# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=mingw-w64-vo-aacenc
pkgver=0.1.3
pkgrel=1
pkgdesc="VisualOn Advanced Audio Coding (AAC) encoder (mingw-w64)"
arch=('any')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=(http://downloads.sourceforge.net/opencore-amr/vo-aacenc-$pkgver.tar.gz)
sha256sums=('e51a7477a359f18df7c4f82d195dab4e14e7414cbd48cf79cc195fc446850f36')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/vo-aacenc-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/vo-aacenc-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

# vim: ts=2 sw=2 et:
