pkgname=mingw-w64-json-c
pkgver=0.13.1
pkgrel=1
pkgdesc="A JSON implementation in C (mingw-w64)"
arch=('any')
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
_releasedate=20180305
source=("https://github.com/json-c/json-c/archive/json-c-${pkgver}-${_releasedate}.tar.gz"
        "001-install-private-header.patch")
sha256sums=('5d867baeb7f540abe8f3265ac18ed7a24f91fe3c5f4fd99ac3caba0708511b90'
            '3c568a03261221de4bca787a1a1321246dc0edc7f58b4c47521dbead78cab2a4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/json-c-json-c-${pkgver}-${_releasedate}/"
  patch -Np1 -i "${srcdir}/001-install-private-header.patch"
  
  ./autogen.sh
}

build() {
  cd "${srcdir}/json-c-json-c-${pkgver}-${_releasedate}/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/json-c-json-c-${pkgver}-${_releasedate}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
