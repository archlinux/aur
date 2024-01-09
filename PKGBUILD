# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Michel Zou <xantares09@hotmail.com>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=retdec
pkgver=5.0
pkgrel=2
pkgdesc="A retargetable machine-code decompiler based on LLVM"
arch=('x86_64')
url="https://retdec.com/"
license=('MIT')
depends=('openssl' 'python' 'zlib')
makedepends=('cmake' 'doxygen' 'graphviz')
optdepends=('upx: To use UPX unpacker in the preprocessing stage'
            'graphviz: To generate call or control flow grpahs')
source=("https://github.com/avast/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        '00-fix-missing-cstdint.patch'
        '01-use-yaramod-v3.21.0.patch')
sha256sums=('216dc62fd54ff06277497492dbf44bc7a91e39249d8aefdee2e4f10fc903ce85'
            '4e4cd25fc540b45985d5b670c41de88edac3af2efd0b708a6c83b561b23631dc'
            'd461f420b23fe00669c24c82d94de97b8caffde84ad164ed47f19e77348c55e3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-fix-missing-cstdint.patch"
    patch -Np1 -i "$srcdir/01-use-yaramod-v3.21.0.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DRETDEC_DOC=ON \
        ..
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver/build"
    make install
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
}

# vim: set sw=4 ts=4 et:
