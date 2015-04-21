# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.02.05
pkgrel=1
pkgdesc="Accelerator Optics simulation code, latest development release"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11')
conflicts=('madx-svn')
provides=('madx')
makedepends=('cmake')
arch=('x86_64')


tarball=madx-src.tgz
sources=madx-${pkgver}

source=("http://madx.web.cern.ch/madx/releases/${pkgver}/${tarball}")
md5sums=('SKIP')

prepare() {
    mkdir build
    cd build

    find . -name '._*' -print0 | xargs -0 -r rm

    cmake \
        -DCMAKE_C_COMPILER=gcc \
        -DCMAKE_Fortran_COMPILER=gfortran \
        -DMADX_STATIC=OFF \
        -DMADX_ONLINE=OFF \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBINARY_POSTFIX=_dev \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        ../${sources}
}

build() {
    cd build
    make
}

check() {
    cd build
    # ctest -E LONG
}

package() {
    cd build
    make DESTDIR=${pkgdir} install

    cd ${srcdir}/${sources}
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
