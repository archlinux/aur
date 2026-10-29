# Maintainer: Peter Mattern <pmattern at arcor dot de>

_pkgname=fatrat
pkgname="${_pkgname}-git"
pkgver=1.3.1.r104.g2b3dfda4
pkgrel=1
pkgdesc='Qt Download/Upload Manager'
arch=('i686' 'x86_64' 'aarch64')
url='https://fatrat.dolezel.info'
license=('GPL-3.0-only')
depends=('qt6-svg' 'qt6-tools' 'pybind11' 'libtorrent-rasterbar')
optdepends=('desktop-file-utils: add application to MIME database')
makedepends=('git' 'cmake' 'npm' 'boost')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/lubosd/fatrat.git")
sha256sums=("SKIP")

pkgver() {
    cd ${_pkgname}
    git describe --always --tags | sed 's/-/.r/;s/-/./'
}

build() {
    rm -Rf build && mkdir build
    cd build
    cmake ../${_pkgname}/ \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DWITH_EVERYTHING=ON
    make
}

package() {
    cd build
    make DESTDIR="${pkgdir}" install
    install -D -m644 "${srcdir}"/${_pkgname}/LICENSE \
      -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
