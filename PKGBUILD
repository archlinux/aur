# Maintainer: Mykola Dimura <mykola.dimura@gmail.com>
pkgname=pteros
pkgver=2.8.r144.g2965c2b0
pkgrel=1
pkgdesc="C++ library for molecular modeling."
arch=('any')
url='https://github.com/yesint/pteros'
license=('Artistic License 2.0')
depends=('pybind11' 'boost' 'eigen' 'libfmt.so' 'libspdlog.so')
makedepends=('cmake' 'git')
options=('!strip' '!buildflags' 'staticlibs')
source=("${pkgname}"'::git+https://github.com/yesint/pteros.git#branch=master')
sha1sums=('SKIP')

build() {
    cmake -DWITH_OPENBABEL=OFF \
        -DWITH_GROMACS=OFF \
        -DDOWNLOAD_DEPS=OFF \
        -B "${pkgname}/build" \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C "${pkgname}/build" all
}

package() {
    make -C "${pkgname}/build" DESTDIR="$pkgdir" install
    install -D -m644 "${pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
 
pkgver() {
  git -C ${pkgname} describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}
