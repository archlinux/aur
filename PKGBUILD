# Maintainer: Dennis van der Schagt <dennisschagt@gmail.com>
# Contributor: Jens Carl <jc [dot] archlinux [at] jens-carl [dot] de>

pkgname=foonathan_memory-shared
pkgver=0.7.1
_pkgver=0.7-1
pkgrel=3
pkgdesc="STL compatible C++ memory allocator library build with BUILD_SHARED_LIBS=ON"
url="https://www.jonathanmueller.dev/project/#memory"
arch=('x86_64')
license=('ZLIB')
makedepends=('cmake' 'git')
conflicts=('foonathan_memory')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/foonathan/memory/archive/v${_pkgver}.tar.gz"
        'CMakeLists.txt.patch')
sha256sums=('19eb61c5cba6ccc40b8ee741350fd29402a46641ba752c30b7079528d87dbc79'
            'cde9ea8ec2ebe61e42f7ed3113a9d7ef776fc420b14dbf1b50d0d5a770ea4447')

prepare() {
    cd "${srcdir}/memory-${_pkgver}/"

    rm -rf build && mkdir build
    patch -u test/CMakeLists.txt -i "${srcdir}/../CMakeLists.txt.patch"
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
