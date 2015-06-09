pkgname=mingw-w64-libsquish
pkgver=1.11
pkgrel=2
pkgdesc="DXT compression library (mingw-w64)"
arch=(any)
url="http://code.google.com/p/libsquish"
license=("MIT")
makedepends=(mingw-w64-gcc dos2unix)
depends=(mingw-w64-crt)
options=(!libtool !strip !buildflags staticlibs)
source=("http://libsquish.googlecode.com/files/squish-$pkgver.zip"
"config" "gcc440.patch")
sha1sums=('1fdff1ba72a002900c877baebcf0aeab9af4922b'
          'f01a5391337cc5461b3d6361b0453f1f31c6019a'
          '51bcc11eafbf79d9cde24769397c7a42f886154a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/squish-$pkgver"
  find . -type f -exec dos2unix {} \;
  patch -Np0 -i ../gcc440.patch
}

build() {
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cp -r "${srcdir}/squish-${pkgver}/"* "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    rm config
    cp "$srcdir/config" .
    sed -i "s,@DESTDIR@,$pkgdir/usr/${_arch}," config
    AR=${_arch}-ar CXX=${_arch}-g++ make
    ${_arch}-g++ -shared *.o -o libsquish.dll -Xlinker --out-implib -Xlinker libsquish.dll.a
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${pkgname}-${pkgver}-build-${_arch}"
    mkdir -p "$pkgdir/usr/${_arch}/"{include,lib}
    make install
    install -Dm644 libsquish.dll "$pkgdir/usr/${_arch}/bin/libsquish.dll"
    install -m644 libsquish.dll.a "$pkgdir/usr/${_arch}/lib/"
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
