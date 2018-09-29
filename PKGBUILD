# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=dlib-git
_pkgname=dlib
pkgrel=1
pkgver=r7572.0072afbc
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
provides=('dlib')
conflicts=('dlib')
replaces=('dlib')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    mkdir -p build
    cd build
    export CMAKE_PREFIX_PATH=/opt/cuda/
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCUDA_SDK_ROOT_DIR=/opt/cuda/ -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda/ -DCUDA_HOST_COMPILER=/usr/bin/gcc-7 -DCMAKE_INSTALL_LIBDIR=/usr/lib/
}

package() {
    cd "${srcdir}/${_pkgname}/build"

    make DESTDIR="${pkgdir}" install
}
