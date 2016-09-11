# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.02.10
pkgrel=3
pkgdesc="Accelerator Optics simulation code, latest development release"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11' 'lapack')
conflicts=('madx-svn')
provides=('madx')
makedepends=('cmake')
arch=('x86_64')


tarball=madx-src.tgz
sources=madx-${pkgver}

source=("http://madx.web.cern.ch/madx/releases/${pkgver}/${tarball}"
        setupGNU.cmake.patch)
md5sums=('317ebc91175e851e35ffb9b79ef81edf'
         'b0d47db22fb4b24ff5b30d58f3d35b6f')

prepare() {
    cd ${srcdir}/${sources}
    find . -name '._*' -print0 | xargs -0 -r rm
    patch -p0 <../setupGNU.cmake.patch

    mkdir -p ${srcdir}/build
    cd ${srcdir}/build

    cmake \
        -DCMAKE_C_COMPILER=gcc \
        -DCMAKE_Fortran_COMPILER=gfortran \
        -DMADX_STATIC=OFF \
        -DMADX_ONLINE=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBINARY_POSTFIX=_dev \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_RPATH='$ORIGIN' \
        ${srcdir}/${sources}
}

build() {
    cd ${srcdir}/build
    make
}

check() {
    cd ${srcdir}/build
    # ctest -E LONG
}

package() {
    cd ${srcdir}/build
    make DESTDIR=${pkgdir} install
    # resolve conflict with 'ndiff' from package 'nmap':
    mv ${pkgdir}/usr/bin/n{,um}diff

    cd ${srcdir}/${sources}
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
