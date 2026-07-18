pkgname=mingw-w64-cfitsio
pkgver=4.6.4
pkgrel=1
pkgdesc="A library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format (mingw-w64)"
arch=("any")
url="https://heasarc.gsfc.nasa.gov/fitsio/"
license=("custom")
makedepends=("mingw-w64-cmake")
depends=("mingw-w64-zlib")
options=("!strip" "!buildflags" "staticlibs")
source=(https://heasarc.gsfc.nasa.gov/FTP/software/fitsio/c/cfitsio-$pkgver.tar.gz)
sha512sums=("18ad3b94cc2bc792b932d4bc9ddd1537d350597792bf31136a1a488cfa13d953060de5007aa986b4f295224c5f3579404a2a125ce065830da7ffaada40b4f62c")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd cfitsio-${pkgver}

    for _arch in ${_architectures}; do
        mkdir -p build-${_arch} && pushd build-${_arch}
        ${_arch}-cmake -DUSE_CURL=OFF ..
        make
        popd
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "$srcdir/cfitsio-$pkgver/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
        ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    done
}
