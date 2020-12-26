# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=anvill
pkgver=0.1.24
pkgrel=1
pkgdesc="Forge beautiful LLVM bitcode out of raw machine code"
arch=('x86_64')
url="https://github.com/lifting-bits/anvill"
license=('Apache')
depends=('cxx-common=0.1.1' 'remill' 'python' 'libunwind')
makedepends=('cmake' 'python-setuptools')
source=("https://github.com/lifting-bits/anvill/archive/v${pkgver}.tar.gz"
        '00-install-specify-bitcode.patch'
        '01-remove-python-installation.patch')
sha256sums=('cde3a269370b6c472877b7c3aca72526e19ff10eb1bb3c6bba2ff8649bb67c5a'
            '3207d6df5edf7ddea2c8b7d6176089bd612bbffa3d4c8f0e29f1c98b1e52dcc2'
            'b586e9c1bb82f8e55eaca96b7a462a711c751e3684575d3212a13a0aa27da8de')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-install-specify-bitcode.patch"
    patch -Np1 -i "$srcdir/01-remove-python-installation.patch"
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
        "$srcdir/$pkgname-$pkgver"
    make

    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install

    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
}

# vim: set sw=4 ts=4 et:
