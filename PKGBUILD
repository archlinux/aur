# Maintainer: Yngve Inntjore Levinsen <yngveTODlevinsenTAcernTODch>

pkgname=madx-dev
pkgver=5.02.04
pkgrel=1
pkgdesc="Accelerator Optics simulation code, latest development release"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11')
conflicts=('madx-svn')
provides=('madx')
makedepends=('cmake')
arch=('x86_64')


tarball=madx-${pkgver}.tgz
sources=madx-${pkgver}

source=("http://madx.web.cern.ch/madx/releases/${pkgver}/${tarball}")
md5sums=('SKIP')

prepare() {
    mkdir build
    cd build

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
