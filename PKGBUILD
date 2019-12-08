# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=dlib-git
_pkgname=dlib
pkgrel=1
pkgver=r7718.b0e3c360
pkgdesc="General purpose C++ library using contract programming and modern C++ techniques"
arch=('i686' 'x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('glibc')
optdepends=('cblas: for BLAS support'
            'cuda: for CUDA support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'sqlite: for sqlite support')
source=('git+https://github.com/davisking/dlib')
sha256sums=(SKIP)
makedepends=('cmake' 'git')
provides=('dlib')
conflicts=('dlib')
replaces=('dlib')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DCUDA_HOST_COMPILER='/opt/cuda/bin/gcc' \
        -DCMAKE_BUILD_TYPE=Release \
        ..
    if [[ -f "/usr/lib/ccache/bin/nvcc-ccache" ]] ; then
        cmake \
          -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache \
          -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/gcc \
          ..
    fi
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"

    make DESTDIR="${pkgdir}" install
}
