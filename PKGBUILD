# Maintainer: Thomas Gläßle <t_glaessleATgmxDOTnet>

pkgname=madx-dev
pkgver=5.09.03
pkgrel=1
pkgdesc="Accelerator Optics simulation code, shared object, development files"
url="http://cern.ch/mad"
license=("custom")
depends=('gcc-libs' 'libx11' 'lapack')
conflicts=('madx-git')
provides=('madx')
makedepends=('cmake' 'gcc-fortran')
arch=('x86_64')

tarball=${pkgver}.tar.gz
extract=MAD-X-${pkgver}

source=("https://github.com/MethodicalAcceleratorDesign/MAD-X/archive/${tarball}")
sha256sums=('cd57f9451e3541a820814ad9ef72b6e01d09c6f3be56802fa2e95b1742db7797')

build() {
    cmake -S "${srcdir}/${extract}" \
        -B "${srcdir}"/build \
        -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=ON \
        -DMADX_STATIC=OFF \
        -DMADX_ONLINE=OFF \
        -DMADX_INSTALL_DOC=OFF \
        -DMADX_X11=ON

    cmake --build "${srcdir}"/build
}

check() {
    cd "${srcdir}"/build
    # export GFORTRAN_UNBUFFERED_PRECONNECTED=y
    # ctest -E LONG
}

package() {
    cmake --build "$srcdir"/build --target install

    # resolve conflict with 'ndiff' from package 'nmap':
    mv "${pkgdir}"/usr/bin/n{,um}diff

    install -D -m644 "${srcdir}/${extract}"/License.txt \
        "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
