# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.04.02
pkgrel=1
pkgdesc="Accelerator Optics simulation code, shared object, development files"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11' 'lapack')
conflicts=('madx-svn')
provides=('madx')
makedepends=('cmake' 'gcc-fortran')
arch=('x86_64')

tarball=${pkgver}.tar.gz
extract=MAD-X-${pkgver}

source=("https://github.com/MethodicalAcceleratorDesign/MAD-X/archive/${tarball}")
md5sums=('caa9526bd4336a306a616530fe5fddfd')

build() {
    rm -rf ${srcdir}/build
    mkdir -p ${srcdir}/build
    cd ${srcdir}/build
    cmake \
        -DMADX_STATIC=OFF \
        -DMADX_ONLINE=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_GC=ON \
        -DCMAKE_BUILD_TYPE=Release \
        -DMADX_INSTALL_DOC=OFF \
        ${srcdir}/${extract}
    make
}

check() {
    cd ${srcdir}/build
    # export GFORTRAN_UNBUFFERED_PRECONNECTED=y
    # ctest -E LONG
}

package() {
    cd ${srcdir}/build
    make DESTDIR=${pkgdir} install
    # resolve conflict with 'ndiff' from package 'nmap':
    mv ${pkgdir}/usr/bin/n{,um}diff

    cd ${srcdir}/${extract}
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
