# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.1.1
pkgrel=2
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/trailofbits/cxx-common"
license=('Apache')
depends=('openssl' 'ncurses' 'libxml2' 'zlib')
makedepends=('clang' 'cmake' 'ninja' 'git')
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/trailofbits/cxx-common/archive/v${pkgver}.tar.gz")
sha256sums=('97a0a35f9dcf65b2f1406aa77fb27594212ed4271a6e21dc26b430adfbf4e92d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i ./build_dependencies.sh \
        -e '/bootstrap-vcpkg\.sh/s/$/ -useSystemBinaries -disableMetrics/'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./build_dependencies.sh --release llvm-10
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./vcpkg/vcpkg export --x-all-installed \
        --overlay-ports=./ports --overlay-triplets=./triplets --raw \
        --output="$pkgdir/opt/$pkgname"
    chmod a+x "$pkgdir/opt/$pkgname/installed/x64-linux-rel/tools/protobuf/protoc-3.14.0.0"
}

# vim: set sw=4 ts=4 et:
