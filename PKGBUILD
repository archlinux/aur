# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>
# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Michel Zou <xantares09@hotmail.com>

pkgname=retdec
pkgver=5.0
pkgrel=4
pkgdesc="A retargetable machine-code decompiler based on LLVM"
arch=('x86_64')
url="https://github.com/avast/retdec"
license=('MIT')
depends=('openssl' 'python' 'zlib')
makedepends=('cmake' 'doxygen' 'graphviz')
optdepends=('upx: To use UPX unpacker in the preprocessing stage'
            'graphviz: To generate call or control flow grpahs')
source=("https://github.com/avast/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        '00-fix-missing-cstdint.patch'
        '01-use-yaramod-v3.21.0.patch')
sha256sums=('216dc62fd54ff06277497492dbf44bc7a91e39249d8aefdee2e4f10fc903ce85'
            '336c3eaf70faf398adbc4a5253278f89913b22f551882b802f857f1f41a441c0'
            'd461f420b23fe00669c24c82d94de97b8caffde84ad164ed47f19e77348c55e3')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-fix-missing-cstdint.patch"
    patch -Np1 -i "$srcdir/01-use-yaramod-v3.21.0.patch"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # retdec 5.0 and the dependencies it builds itself (llvm, yaramod, fmt, ...)
    # still declare cmake_minimum_required < 3.5, which CMake 4 rejects. This
    # variable is CMake's documented override and is inherited by the nested
    # ExternalProject builds. Drop it once upstream releases with newer minimums.
    export CMAKE_POLICY_VERSION_MINIMUM=3.5

    # CMAKE_INSTALL_PREFIX deliberately points into $pkgdir instead of using
    # the usual /usr prefix + DESTDIR. retdec's support/CMakeLists.txt runs
    # install(CODE) steps that download the retdec-support archive, execute the
    # freshly installed retdec-yarac, and delete/recreate the support directory
    # at the *absolute* prefix path, ignoring DESTDIR. With a /usr prefix those
    # steps would touch the live system. The decompiler locates share/retdec
    # relative to its own binary at runtime, so the staged prefix is not baked
    # into the installed files.
    cmake -B build -S . \
        -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DRETDEC_DOC=ON
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake --install build
    install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
}

# vim: set sw=4 ts=4 et:
