pkgname=mingw-w64-json-c
pkgver=0.17
pkgrel=1
pkgdesc="A JSON implementation in C (mingw-w64)"
arch=('any')
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/json-c/json-c/archive/json-c-${pkgver//_/-}.tar.gz"
        "001-install-private-header.patch")
sha256sums=('fc1b9ed57f4cda51c52ec9b3b012f6973bd8d80fb70f363c5ca2754342389eb1'
            'ac8c5c306bae8fc098c1420c78eab9c9d026f874614f24466987af5f30c70b20')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/json-c-json-c-${pkgver}"
  patch -Np1 -i "${srcdir}/001-install-private-header.patch"
}

build() {
  cd "${srcdir}/json-c-json-c-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF -DHAVE_SNPRINTF=1 ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/json-c-json-c-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
