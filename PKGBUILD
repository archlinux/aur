pkgname=mozart2-git
pkgver=v2.0.1.8.gdb41d83e
pkgrel=1
pkgdesc="The Mozart Programming System version 2"
arch=('x86_64')
url="https://github.com/mozart/mozart2"
license=('BSD')
depends=('boost-libs' 'tk' 'gmp' 'hicolor-icon-theme' 'xdg-utils')
optdepends=('emacs: Interactive programming interface (recommended)')
makedepends=('java-runtime-headless' 'emacs' 'gcc' 'boost>=1.61' 'cmake' 'gtest' 'clang' 'clang-tools-extra' 'llvm')
provides=('mozart2')
conflicts=('mozart2' 'mozart2-bin' 'mozart2-compiler')
install="${pkgname}.install"
source=(
    "$pkgname::git+https://github.com/mozart/mozart2"
)
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --always | sed 's|-|.|g'
}

prepare() {
    cd "$srcdir/$pkgname"
    git submodule update --init
    patch -Np1 -i "../../gmp.patch"
}

build() {
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"
    cmake \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr/ \
          -DCMAKE_CXX_COMPILER_ARCHITECTURE=x64 \
          -Wno-dev \
          "$srcdir/$pkgname"
    make -j$(nproc)
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir/" install

    install -D -m644 "$srcdir/$pkgname/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

