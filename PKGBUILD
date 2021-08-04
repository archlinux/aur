# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-json-c
pkgver=0.15
pkgrel=1
pkgdesc="A JSON implementation in C (mingw-w64)"
arch=('any')
url="https://github.com/json-c/json-c/wiki"
license=('MIT')
makedepends=('mingw-w64-cmake')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://github.com/json-c/json-c/archive/json-c-${pkgver//_/-}.tar.gz"
        "001-install-private-header.patch"
        "002-library-version.patch"
        "fix-snprintf.patch")
sha256sums=('74985882e39467b34722e584ab836ed2abd47061888f318125fd4b167002afd5'
            '197e33a56fc3d655e058d6936e92698c8aa65b7297cb218345b8ad51350c4ecf'
            '2288c0ad1c0f98f2b43a8e4bdd09a6cf91710c7c8b1e7bf7a2b516ed21e81705'
            'df185895f20f5591717daa6075c29a6b99b9dbcbc94e1b753689a8952cd95577')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/json-c-json-c-${pkgver}"
  patch -Np1 -i "${srcdir}/001-install-private-header.patch"
  patch -Np1 -i "${srcdir}/002-library-version.patch"
  patch -Np1 -i "${srcdir}/fix-snprintf.patch"
}

build() {
  cd "${srcdir}/json-c-json-c-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_TESTING=OFF ..
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
