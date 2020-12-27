# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=mcsema
pkgver=3.0.14
pkgrel=1
pkgdesc="Framework for lifting program binaries to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/mcsema"
license=('AGPL3')
depends=('cxx-common=0.1.1' 'remill' 'anvill' 'python' 'libunwind')
makedepends=('cmake' 'python-setuptools')
source=("https://github.com/lifting-bits/mcsema/archive/v${pkgver}.tar.gz")
sha256sums=('4ba350e43b92032d9689a3764ebdee6ab2f2340ba6fd363ece94f8aa9d8be179')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i tools/setup_launcher_py{2,3}.sh \
        -e "s|\(setup\.py install.*--prefix=[^ ]*\)|\1 --root='$pkgdir' --optimize=1|"
}

build() {
    vcpkg_libs='/opt/cxx-common/installed/x64-linux-rel'
    export PATH="$vcpkg_libs/bin:${PATH}"
    export CC="$vcpkg_libs/bin/clang"
    export CXX="$vcpkg_libs/bin/clang++"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        -DVCPKG_ROOT="/opt/cxx-common" \
        -DMCSEMA_INSTALL_PYTHON2_LIBS=OFF \
        -DMCSEMA_INSTALL_PYTHON3_LIBS=ON \
        "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
}

# vim: set sw=4 ts=4 et:
