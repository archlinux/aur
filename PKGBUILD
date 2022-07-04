# Maintainer: Timo Sarawinsi <tino@it-kraut.net>

_pkgbase=dlib
pkgname=("dlib-sse" "dlib-sse-cuda")
pkgver=19.24
pkgrel=1
_commit=600e03655274f0e7f2013d8d3cd5a3799843186b
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
optdepends=('giflib: for GIF support'
            'sqlite: for sqlite support')
makedepends=('cmake' 'ccache-ext' 'ccache' 'cuda' 'cudnn')
provides=("dlib")
source=("https://github.com/davisking/dlib/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3cc42e84c7b1bb926c6451a21ad1595f56c5b10be3a1d7aa2f3c716a25b7ae39')
build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    cd ..
    mkdir -p build && cd build
    #cmake -GNinja \
    cmake  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
	-DDLIB_ENABLE_ASSERTS=ON \
	-DDLIB_PNG_SUPPORT=ON \
	-DDLIB_JPEG_SUPPORT=ON \
        -DDLIB_GIF_SUPPORT=ON \
        -DUSE_AVX_INSTRUCTIONS=ON \
	-DDLIB_USE_LAPACK=ON \
	-DDLIB_USE_FFTW=ON \
        -DDLIB_LINK_WITH_SQLITE3=ON \
        -DUSE_SSE2_INSTRUCTIONS=ON \
        -DUSE_SSE4_INSTRUCTIONS=ON \
	-DDLIB_USE_BLAS=ON \
        -DDLIB_USE_CUDA=OFF \
        "../${_pkgbase}-${pkgver}"
    #ninja ${MAKEFLAGS:--j1}
    cmake --build . --config Release -- -j $(nproc)

    cd "${srcdir}"
    mkdir -p build-cuda && cd build-cuda
 #  cmake -GNinja \
     cmake  \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DUSE_AVX_INSTRUCTIONS=ON \
        -DDLIB_USE_LAPACK=ON \
        -DDLIB_ENABLE_ASSERTS=ON \
        -DDLIB_PNG_SUPPORT=ON \
	-DDLIB_JPEG_SUPPORT=ON \
        -DDLIB_GIF_SUPPORT=ON \
        -DDLIB_USE_BLAS=ON \
        -DUSE_SSE2_INSTRUCTIONS=ON \
        -DUSE_SSE4_INSTRUCTIONS=ON \
        -DDLIB_USE_FFTW=ON \
        -DDLIB_LINK_WITH_SQLITE3=ON \
        -DDLIB_USE_CUDA=ON \
        -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache \
        "../${_pkgbase}-${pkgver}"
    #inja ${MAKEFLAGS:--j1}
     cmake --build . --config Release  -- -j $(nproc)
}

package_dlib-sse() {
    cd "${srcdir}/build"
    #DESTDIR=${pkgdir} ninja install
    DESTDIR=${pkgdir} cmake --install "$DESTDIR"
    install -Dm644 "../${_pkgbase}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}

package_dlib-sse-cuda() {
    pkgdesc="A general purpose cross-platform C++ library designed using contract programming and modern C++ techniques (with CUDA)"
    depends+=(cuda cudnn)
    conflicts=(dlib)
    cd "${srcdir}/build-cuda"
    #DESTDIR=${pkgdir} ninja install
    DESTDIR=${pkgdir} cmake --install "$DESTDIR"
    install -Dm644 "../${_pkgbase}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
    # remove redundant external libraries
    rm -r "${pkgdir}/usr/include/dlib/external"
}
