# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=dyninst-git
pkgver=v10.2.1.r39.ge5a88825d
pkgrel=1
pkgdesc="Tools for binary instrumentation, analysis, and modification"
arch=('any')
url="https://dyninst.org/"
license=('LGPL')
depends=('libelf' 'tbb' 'boost-libs')
makedepends=('git' 'cmake' 'boost')
provides=('dyninst')
conflicts=('dyninst')
source=("$pkgname::git+https://github.com/dyninst/dyninst.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"
    mkdir -p build && cd build
    cmake \
        -DSTERILE_BUILD=ON \
        -DENABLE_STATIC_LIBS=YES \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname"
    make
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
