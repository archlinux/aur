# Maintainer: Corey Powell (mistdragon100@gmail.com)
# Swiped from the official libyaml package and modified for mingw-w64
# Also swiped some code from 0X1A and Schala's mingw-w64-libyaml
pkgname=mingw-w64-libyaml
pkgver=0.1.6
pkgrel=1
pkgdesc="YAML 1.1 library (mingw-w64)"
arch=('any')
url="http://pyyaml.org/wiki/LibYAML"
license=('MIT')
makedepends=('mingw-w64-gcc')
depends=('mingw-w64-crt')
options=(staticlibs !strip !buildflags)
source=(http://pyyaml.org/download/libyaml/yaml-${pkgver}.tar.gz)
md5sums=('5fe00cda18ca5daeb43762b80c38e06e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/yaml-${pkgver}"
  unset LDFLAGS
  for _arch in ${_architectures}; do
    cp -R "${srcdir}/yaml-${pkgver}" "${srcdir}/yaml-${pkgver}-${_arch}"
    cd ${srcdir}/yaml-${pkgver}-${_arch}
    #Finally compile
    ./configure \
      --prefix=/usr/${_arch} \
      --build=$CHOST \
      --host=${_arch} \
      CFLAGS="-DYAML_DECLARE_STATIC" --enable-static --disable-shared
    make
    ${_arch}-gcc -shared src/*.o -o libyaml.dll -Xlinker --out-implib -Xlinker libyaml.dll.a
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/yaml-${pkgver}-${_arch}"
    make DESTDIR="${pkgdir}" install
    make DESTDIR="$pkgdir" install
    install -Dm644 "libyaml.dll" "${pkgdir}/usr/${_arch}/bin/libyaml.dll"
    install -m644 "libyaml.dll.a" "${pkgdir}/usr/${_arch}/lib/libyaml.dll.a"
    install -m644 -D LICENSE "${pkgdir}/usr/${_arch}/share/licenses/${pkgname}/LICENSE"
    find "$pkgdir/usr/${_arch}" -name '*.exe' | xargs -rtl1 rm
    find "$pkgdir/usr/${_arch}" -name '*.dll' | xargs -rtl1 ${_arch}-strip --strip-unneeded
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs -rtl1 ${_arch}-strip -g
  done
}
