# Maintainer: pingplug < aur at pingplug dot me >
# Maintainer: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: perlawk

pkgname=dlib-cuda
pkgver=19.24
pkgrel=1
pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://dlib.net"
license=('custom')
depends=('cblas'
         'lapack'
         'blas'
         'libjpeg-turbo'
         'libpng'
         'libx11')
provides=('dlib')
conflicts=('dlib')
optdepends=('giflib: for GIF support'
            'libwebp: for WebP support'
            'sqlite: for sqlite support')
makedepends=('cmake' 'ninja' 'cuda' 'cudnn')
source=("http://dlib.net/files/dlib-${pkgver}.tar.bz2")
sha256sums=('28fdd1490c4d0bb73bd65dad64782dd55c23ea00647f5654d2227b7d30b784c4')

build() {
    cd "${srcdir}"
    mkdir -p build && cd build
    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=ON \
        -DDLIB_USE_CUDA=ON \
        "../dlib-${pkgver}"
    ninja ${MAKEFLAGS:--j1}
}

package() {
    cd "${srcdir}/build"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../dlib-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/dlib/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}
