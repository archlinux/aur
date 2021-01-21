# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
# Contributor: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=foonathan_memory-shared
pkgver=0.6.2
_pkgver=0.6-2
pkgrel=2
pkgdesc="STL compatible C++ memory allocator library build with BUILD_SHARED_LIBS=ON"
url="http://foonathan.net/memory"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
conflicts=('foonathan_memory')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foonathan/memory/archive/v${_pkgver}.tar.gz"
        'git+https://github.com/foonathan/compatibility.git#commit=cd14212'
        'pin-catch-version.patch')
sha256sums=('cf302578f3b6721707b8428fd9b97182ada1970ce56f8881ea0b3390b97e66e3'
            'SKIP'
            'a9736f5561bcf58981513142ccf1a1bed85259dd4bd5bc515860a519648b5484')

prepare() {
    cd "${srcdir}/memory-${_pkgver}/"

    patch --forward --strip=1 --input="${srcdir}/pin-catch-version.patch"

    rm -rf build && mkdir build

    cd cmake/comp
    ln -sf "${srcdir}/compatibility/comp_base.cmake"
}

build() {
    cd "${srcdir}/memory-${_pkgver}"

    cd build
    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON
    make
}

package() {
    cd "${srcdir}/memory-${_pkgver}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd build
    make DESTDIR="${pkgdir}/" install
}
