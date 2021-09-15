# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=mcsema
pkgver=3.0.26
pkgrel=1
pkgdesc="Framework for lifting program binaries to LLVM bitcode"
arch=('x86_64')
url="https://github.com/lifting-bits/mcsema"
license=('AGPL3')
depends=('cxx-common=0.1.4' 'remill' 'anvill' 'libunwind' 'python'
         'python-protobuf')
makedepends=('cmake' 'python-setuptools')
source=("https://github.com/lifting-bits/mcsema/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('553531d15f6a97973759efc0e0924ab09e9c1d487bd344ed713e471e2c77cb3c')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i tools/setup_launcher_py3.sh \
        -e "s|\(setup\.py install.*--prefix=[^ ]*\)|\1 --root='$pkgdir' --optimize=1|"
}

build() {
    vcpkg_libs='/opt/cxx-common/installed/x64-linux-rel'
    export PATH="$vcpkg_libs/bin:$vcpkg_libs/tools/*:${PATH}"
    export CC="$vcpkg_libs/tools/llvm/clang"
    export CXX="$vcpkg_libs/tools/llvm/clang++"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DMCSEMA_INSTALL_PYTHON3_LIBS=ON \
        -DVCPKG_ROOT="/opt/cxx-common" \
        "$srcdir/$pkgname-$pkgver"
    cmake --build .
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    DESTDIR="${pkgdir}" cmake --build . --target install
}

# vim: set sw=4 ts=4 et:
