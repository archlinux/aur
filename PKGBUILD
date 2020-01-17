# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=mingw-w64-snappy
_pkgname=snappy
pkgver=1.1.8
pkgrel=1
pkgdesc="A fast compressor/decompressor library (mingw-w64)"
arch=('any')
url="https://google.github.io/snappy/"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!strip' '!buildflags' 'staticlibs')
source=("${_pkgname}-${pkgver}.tar.gz"::"https://github.com/google/snappy/archive/${pkgver}.tar.gz"
        "snappy.pc")
md5sums=('70e48cba7fecf289153d009791c9977f'
         '99c76caed6b8a392037dab0265a85ce1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  for _arch in ${_architectures}; do
  # Shared
    mkdir -p build-${_arch}-shared && pushd build-${_arch}-shared
    ${_arch}-cmake -DBUILD_SHARED_LIBS=yes -DSNAPPY_BUILD_TESTS=OFF ..
    make
    popd

  # Static
    mkdir -p build-${_arch}-static && pushd build-${_arch}-static
    ${_arch}-cmake -DBUILD_SHARED_LIBS=no -DSNAPPY_BUILD_TESTS=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    # Shared
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}-shared"
    make DESTDIR="${pkgdir}" install
    
    # Static
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}-static"
    make DESTDIR="${pkgdir}" install
    
    # upstream dropped the pkgconfig file and isn't interested in adding it back.
    install -Dm644 "${srcdir}/snappy.pc" "${pkgdir}/usr/${_arch}/lib/pkgconfig/snappy.pc"
    sed -e "s|@PREFIX@|/usr/${_arch}|g" \
        -e "s|@VERSION@|${pkgver}|g" \
        -i "${pkgdir}/usr/${_arch}/lib/pkgconfig/snappy.pc"
    
    # Strip libraries
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
