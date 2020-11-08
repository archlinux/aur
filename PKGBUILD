# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=retdec
pkgver=4.0
pkgrel=2
pkgdesc="A retargetable machine-code decompiler based on LLVM"
arch=('x86_64')
url="https://retdec.com/"
license=('MIT')
depends=('openssl' 'python' 'zlib')
makedepends=('cmake')
optdepends=('upx' 'graphviz')
source=("https://github.com/avast/${pkgname}/archive/v${pkgver}.tar.gz"
        '00-fix-missing-limits.patch')
sha256sums=('b26c2f71556dc4919714899eccdf82d2fefa5e0b3bc0125af664ec60ddc87023'
            '2c6d3e4f6f1ef3e5f8cde37c3dad09fbd67be6fb48601327edc252be2d181c99')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-fix-missing-limits.patch"

    # update LLVM reference
    sed -i cmake/deps.cmake \
        -e 's|d17df7fb9a1d585fdfa3643e666506d1bead4443|e27f1234a585468796f0f34bbaf54a40fc5a2a96|' \
        -e 's|904cffe42bffac3030df0a6bb07b0ccc9c221ac46d7621a49a5f400196e27f3e|4fb916853c223f667fb8af28b036c48d9d6075827c05f41eaabe2531f605f090|'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make install
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set sw=4 ts=4 et:
