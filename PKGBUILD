pkgname=mingw-w64-json-c
pkgver=0.18
pkgdate_=20240915
pkgrel=1
pkgdesc="A JSON implementation in C (mingw-w64)"
arch=('any')
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/json-c/json-c/archive/json-c-${pkgver}-${pkgdate_}.tar.gz"
        "001-install-private-header.patch")
sha256sums=('3112c1f25d39eca661fe3fc663431e130cc6e2f900c081738317fba49d29e298'
            'ac8c5c306bae8fc098c1420c78eab9c9d026f874614f24466987af5f30c70b20')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/json-c-json-c-${pkgver}-${pkgdate_}"
  patch -Np1 -i "${srcdir}/001-install-private-header.patch"
}

build() {
  cd "${srcdir}/json-c-json-c-${pkgver}-${pkgdate_}"
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DBUILD_TESTING=OFF -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -B build-${_arch} .
    make -C build-${_arch}
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/json-c-json-c-${pkgver}-${pkgdate_}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
