# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.02.13
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

source=("http://madx.web.cern.ch/madx/releases/${pkgver}/${tarball}" madx_vim.diff)
md5sums=('11307450b9a25a9d75c7bca42ae18c2c'
         'befa90472e7b5725406c1dab5811102d')

prepare() {
    cd ${srcdir}/${extract}
    find . -name '._*' -print0 | xargs -0 -r rm
    patch -p0 < ${srcdir}/madx_vim.diff

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
        ${srcdir}/${extract}
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

    cd ${srcdir}/${extract}
    install -D -m644 License.txt ${pkgdir}/usr/share/licenses/${pkgname}/license.txt
}
