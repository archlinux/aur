# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.1.8
pkgrel=1
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/lifting-bits/cxx-common"
license=('Apache')
depends=()
makedepends=('clang' 'lld' 'cmake' 'ninja' 'git' 'python')
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/lifting-bits/cxx-common/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3b7825739ea353460b969ed6fc5502eaf882bf11a9a9d881c8b7bbd49e4f1de')

package() {
    export LLVM_VER=13
    export TRIPLET=x64-linux-rel
    export VCPKG_DEFAULT_HOST_TRIPLET=$TRIPLET # https://github.com/lifting-bits/cxx-common/pull/876

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/$pkgname"
    ./build_dependencies.sh --release --clean \
        --export-dir "$pkgdir/opt/$pkgname" \
        llvm-$LLVM_VER

    ## fix prefix paths
    find "$pkgdir/opt/$pkgname/installed/$TRIPLET/lib/pkgconfig/" -type f \
        -exec sed -i -e "s,$srcdir/$pkgname-$pkgver/vcpkg/packages/[^ /]*_\($TRIPLET\),/opt/$pkgname/installed/\1,g" {} +

    ## install lit
    cd "$srcdir/$pkgname-$pkgver"/vcpkg/buildtrees/llvm-$LLVM_VER/src/org-*/llvm/utils/lit
    python setup.py install \
        --prefix="/opt/$pkgname/installed/$TRIPLET" \
        --root="$pkgdir" --optimize=1
}

# vim: set sw=4 ts=4 et:
