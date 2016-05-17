# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.02.08
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
sources=madx-${pkgver}

source=("http://madx.web.cern.ch/madx/releases/${pkgver}/${tarball}"
        setupGNU.cmake.patch)
md5sums=('eeb4242faf8ffeb1d195899e6362d4d4'
         'b0d47db22fb4b24ff5b30d58f3d35b6f')

prepare() {
    cd ${srcdir}/${sources}
    find . -name '._*' -print0 | xargs -0 -r rm
    patch -p0 <../setupGNU.cmake.patch
    cd ..

    mkdir -p build
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
