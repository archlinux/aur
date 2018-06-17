pkgname=mingw-w64-jansson
pkgver=2.11
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data (mingw-w64)"
arch=(any)
url="http://www.digip.org/jansson/"
license=(MIT)
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=(!strip !buildflags staticlibs)
source=("http://www.digip.org/jansson/releases/jansson-${pkgver}.tar.gz")
sha512sums=('0ae77cf7ec264536313639458ba20b66e221078cddd209df3ce45c895b897799954abc1ca4b0d5993b974135652804be6bede2825503469d56303470888382f8')

_architectures=(i686-w64-mingw32 x86_64-w64-mingw32)

build() {
    local arch

    cd "jansson-${pkgver}" 
    for arch in "${_architectures[@]}"; do
        mkdir -p build-${arch}
        pushd build-${arch}
        ${arch}-configure
        make
        popd 
    done
}

package() {
    local arch

    for arch in "${_architectures[@]}"; do
        make \
            -C "jansson-${pkgver}/build-${arch}" \
            DESTDIR="${pkgdir}" \
            install
        ${arch}-strip --strip-unneeded "${pkgdir}"/usr/${arch}/bin/*.dll
        ${arch}-strip -g "${pkgdir}"/usr/${arch}/lib/*.a
    done
}
