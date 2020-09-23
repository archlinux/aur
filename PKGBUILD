# Maintainer: Corey Powell (mistdragon100@gmail.com)
# Swiped from the official libyaml package and modified for mingw-w64
# Also swiped some code from 0X1A and Schala's mingw-w64-libyaml
pkgname=mingw-w64-libyaml
pkgver=0.2.5
pkgrel=1
pkgdesc="YAML 1.1 library (mingw-w64)"
arch=('any')
url="http://pyyaml.org/wiki/LibYAML"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=(staticlibs !strip !buildflags)
source=(http://pyyaml.org/download/libyaml/yaml-${pkgver}.tar.gz)
md5sums=('bb15429d8fb787e7d3f1c83ae129a999')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/yaml-$pkgver/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure CFLAGS="-DYAML_DECLARE_STATIC" --enable-static --disable-shared
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/yaml-$pkgver/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir"/usr/${_arch}/share/man
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    #${_arch}-strip -g "$pkgdir"/usr/${_arch}/bin/*.dll
    find "$pkgdir/usr/${_arch}" -name '*.exe' -delete
    #cd "${srcdir}/yaml-$pkgver"
    #install -m644 -D LICENSE "${pkgdir}/usr/${_arch}/share/licenses/${pkgname}/LICENSE"
  done
}
