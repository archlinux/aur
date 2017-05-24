# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.03.04
pkgrel=2
pkgdesc="Accelerator Optics simulation code, latest development release"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11' 'lapack')
conflicts=('madx-svn')
provides=('madx')
makedepends=('cmake')
arch=('x86_64')

tarball=madx-src.tgz
extract=madx-${pkgver}

source=("http://madx.web.cern.ch/madx/releases/${pkgver}/${tarball}"
        cmake_fix_gc.patch)
md5sums=('efd9df109045cb7937621ec647d86ec0'
         '9edea53d6653e16dc1dbf8853f3d8fe5')

prepare() {
    cd ${srcdir}/${extract}
    find . -name '._*' -print0 | xargs -0 -r rm
    patch -p1 < ${srcdir}/cmake_fix_gc.patch

    mkdir -p ${srcdir}/build
    cd ${srcdir}/build

    cmake \
        -DCMAKE_C_COMPILER=gcc \
        -DCMAKE_Fortran_COMPILER=gfortran \
        -DMADX_STATIC=OFF \
        -DMADX_ONLINE=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBINARY_POSTFIX= \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_RPATH='$ORIGIN' \
        ${srcdir}/${extract}
}

build() {
    cd ${srcdir}/build
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
