# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.4.1
pkgrel=1
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/lifting-bits/cxx-common"
license=('Apache')
depends=()
makedepends=('clang' 'lld' 'cmake' 'ninja' 'git' 'python' 'python-setuptools')
checkdepends=()
options=('staticlibs')
source=("https://github.com/lifting-bits/cxx-common/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('922b92b1fc99e16e4828b2e2463dec5605d131b152de138b5f1990e21bdeee0b')

package() {
    export LLVM_VER=15
    export TRIPLET=x64-linux-rel
    export VCPKG_DEFAULT_HOST_TRIPLET=$TRIPLET # https://github.com/lifting-bits/cxx-common/pull/876

    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p "$pkgdir/opt/$pkgname"
    ./build_dependencies.sh --release \
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
