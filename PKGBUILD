# Maintainer: Myles English <myles at tdma dot co>
pkgname=pastix
pkgver=6.0.1
pkgrel=1
pkgdesc="high performance parallel solver for very large sparse linear systems based on direct methods"
arch=('x86_64')
url="https://gitlab.inria.fr/solverstack/pastix"
license=('CeCILL-C')
#depends=('python2' 'openmpi')
depends=('cblas' 'lapacke' 'scotch' 'hwloc')
makedepends=('gcc-fortran' 'cmake')
#optdepends=('metis' 'parmetis')
#conflicts=("pastix-git")
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=("SKIP")

prepare() {
    cd ${pkgname}
    patch -p2 <../../gitmodules.diff
    /usr/bin/git submodule update --init --recursive
}

build() {
    cd "${srcdir}/${pkgname}"
    [ -d build ] && rm -rf build
    mkdir build
    cd build

    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DPASTIX_INT64=OFF
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make install DESTDIR="${pkgdir}"
    install -Dm644 "${pkgdir}/usr/examples" "${pkgdir}/usr/share/doc/pastix/examples" && \ 
	    rm -rf "${pkgdir}/usr/examples"
}
