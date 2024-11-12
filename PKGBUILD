# Maintainer: envolution
# Contributor: pingplug < aur at pingplug dot me >
# Contributor: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Contributor: perlawk

pkgname=dlib-cuda-git
_pkgname=dlib
pkgver=19.24.6
pkgrel=1
pkgdesc="Cross-platform C++ library using contract programming and modern C++ techniques"
arch=('x86_64')
url="http://dlib.net"
license=('BSL-1.0')
depends=('cblas'
         'lapack'
         'blas'
         'libjpeg-turbo'
         'libjxl'
         'libpng'
         'libwebp'
         'libx11'
         'cuda'
         'cudann'
)
optdepends=('ffmpeg: for FFmpeg support'
            'giflib: for GIF support'
            'sqlite: for sqlite support')
makedepends=('cmake' 'ninja')
source=(
  "${_pkgname}::git+https://github.com/davisking/dlib.git"
)
sha256sums=('SKIP')

build() {
    mkdir -p build && cd build
    cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=OFF \
        -DDLIB_USE_CUDA=ON \
        "../${_pkgname}"
    ninja ${MAKEFLAGS:--j1}
}

package_dlib-git() {
    cd "build"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../${_pkgname}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}

package_dlib-cuda-git() {
    cd "build"
    DESTDIR=${pkgdir} ninja install
    install -Dm644 "../${_pkgname}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}
