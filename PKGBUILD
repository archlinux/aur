pkgname=mingw-w64-jansson
pkgver=2.9
pkgrel=1
pkgdesc="C library for encoding, decoding and manipulating JSON data (mingw-w64)"
arch=(any)
url="http://www.digip.org/jansson/"
license=(MIT)
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(!strip !buildflags staticlibs)
source=("http://www.digip.org/jansson/releases/jansson-${pkgver}.tar.gz")
sha512sums=('ae239e1a825c252d7a3b0ee97004c129a0968f7e9da8679dc665a8e54a34c073b0c274bd5af004700b442f7b703bcc76f5e3360ab82172da7203b3458a5e9cb9')

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
