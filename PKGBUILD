# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=mcsema
pkgver=3.0.10
pkgrel=1
pkgdesc="Framework for lifting program binaries to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/mcsema"
license=('AGPL3')
depends=('remill' 'anvill' 'clang' 'python' 'python-protobuf' 'python-ccsyspath'
         'ncurses')
makedepends=('cmake' 'llvm' 'python-setuptools')
optdepends=('dyninst: alternative frontend to IDA Pro')
source=("https://github.com/lifting-bits/mcsema/archive/v${pkgver}.tar.gz")
sha256sums=('1f803540649187a856c6e16ec3f40fb6d2c63365ae05a12795cf2a09ff88f6aa')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i cmake/modules/FindProtobuf.cmake \
        -e 's|set(LIBRARY_ROOT .*)|set(LIBRARY_ROOT "/usr")|' \
        -e 's|\(libproto[a-z]*\)\.a|\1.so|'
    sed -i tools/setup_launcher_py{2,3}.sh \
        -e "s|\(setup\.py install.*--prefix=[^ ]*\)|\1 --root='$pkgdir' --optimize=1|"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    rm -rf build
    mkdir -p build && cd build
    cmake \
        -DCMAKE_C_COMPILER=/usr/bin/clang \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++ \
        -DMCSEMA_INSTALL_PYTHON2_LIBS=OFF \
        -DMCSEMA_INSTALL_PYTHON3_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname-$pkgver"
        #-DBUILD_MCSEMA_DYNINST_DISASS=1 \
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
