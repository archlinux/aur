# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani@gmail.com>
# Contributor: Antoine Lubineau <antoine@lubignon.info>
# Contributor: Leopold Bloom <blinxwang@gmail.com>
# Contributor: Michal Krenek (a.k.a. Mikos) <m.krenek@gmail.com>

pkgname=beignet
pkgver=1.2.1
pkgrel=1
pkgdesc="An open source OpenCL implementation for Intel IvyBridge+ iGPUs"
arch=('x86_64')
url="https://01.org/${pkgname}"
license=('LGPL')
depends=('glu' 'llvm' 'mesa' 'ocl-icd' 'opencl-headers')
makedepends=('clang' 'cmake' 'python')
provides=('opencl-intel')
conflicts=('opencl-intel')
source=("https://01.org/sites/default/files/${pkgname}-${pkgver}-source.tar.gz")
sha256sums=('b74eb03534a12b86a896cdbd8209b072c8a38e7af456195793a498428a7ac81f')

prepare() {
    mkdir -p "${pkgname^}-${pkgver}-Source/build"
}

build() {
    cd "${pkgname^}-${pkgver}-Source/build"

    cmake .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_BUILD_TYPE=RELEASE
    make
}

package() {
    cd "${pkgname^}-${pkgver}-Source/build"

    make DESTDIR="${pkgdir}" install

    # Remove headers already provided by 'opencl-headers'
    cd "${pkgdir}/usr/include/CL"
    rm cl.h cl.hpp cl_egl.h cl_ext.h cl_gl.h cl_gl_ext.h cl_platform.h opencl.h
}
