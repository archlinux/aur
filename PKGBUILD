# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=anvill
pkgver=0.1.20
pkgrel=4
pkgdesc="Forge beautiful LLVM bitcode out of raw machine code"
arch=('x86_64')
url="https://github.com/lifting-bits/anvill"
license=('Apache')
depends=('cxx-common=0.0.14' 'remill' 'python' 'ncurses' 'zlib')
makedepends=('python-setuptools')
source=("https://github.com/lifting-bits/anvill/archive/v${pkgver}.tar.gz"
        '00-install-specify-bitcode.patch'
        '01-remove-python-installation.patch')
sha256sums=('08241cefeb3e64519c2ad23d0ba8c6c8ef983759de0cff16b0e4a68a77146d48'
            'c97e0a015290ae72a80780898d328c59f741c735589ce40573c7a4c182938c3e'
            '9d6716c7aeb2c584ff201b6671b74bb1411182d5e3af9d288e219f70a8fcba63')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-install-specify-bitcode.patch"
    patch -Np1 -i "$srcdir/01-remove-python-installation.patch"
}

build() {
    export TRAILOFBITS_LIBRARIES="/opt/cxx-common/libraries"
    export PATH="${TRAILOFBITS_LIBRARIES}/cmake/bin:${TRAILOFBITS_LIBRARIES}/llvm/bin:${PATH}"

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    "${TRAILOFBITS_LIBRARIES}/cmake/bin/cmake" \
        -DCMAKE_C_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang" \
        -DCMAKE_CXX_COMPILER="${TRAILOFBITS_LIBRARIES}/llvm/bin/clang++" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_VERBOSE_MAKEFILE=True \
        "$srcdir/$pkgname-$pkgver"
    make

    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make DESTDIR="${pkgdir}" install
    rm -rf "$pkgdir/usr/share"

    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install \
        --prefix=/usr \
        --root="$pkgdir" \
        --optimize=1 \
        --skip-build
}

# vim: set sw=4 ts=4 et:
