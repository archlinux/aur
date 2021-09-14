# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.1.4
pkgrel=1
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/lifting-bits/cxx-common"
license=('Apache')
depends=()
makedepends=('clang' 'lld' 'cmake' 'ninja' 'git' 'python')
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/lifting-bits/cxx-common/archive/refs/tags/v${pkgver}.tar.gz"
        '00-fix-missing-header.patch')
sha256sums=('03b9248af46f54e191abf0277b9d0d6d316d7927d1afa68006b0e50eb7d89077'
            '2872fbced5424a683615ff1c2d9af6bd6d4d364ff1f65f32581271a3ddaefaa9')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-fix-missing-header.patch"
    sed -i ./build_dependencies.sh \
        -e '/bootstrap-vcpkg\.sh/s/$/ -useSystemBinaries -disableMetrics/'
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    CPPFLAGS='' ./build_dependencies.sh --release llvm-10

    cd "$srcdir/$pkgname-$pkgver"/vcpkg/buildtrees/llvm-10/src/org-*/llvm/utils/lit
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    ./vcpkg/vcpkg export --x-all-installed "@overlays.txt" --raw \
        --output="$pkgdir/opt/$pkgname"

    ## fix prefix paths
    find "$pkgdir/opt/$pkgname/installed/x64-linux-rel/lib/pkgconfig/" -type f \
        -exec sed -i -e "s,$srcdir/$pkgname-$pkgver/vcpkg/packages/[^ ]*_x64-linux-rel,/opt/$pkgname/installed/x64-linux-rel,g" {} +

    ## install lit
    cd "$srcdir/$pkgname-$pkgver"/vcpkg/buildtrees/llvm-10/src/org-*/llvm/utils/lit
    python setup.py install \
        --prefix="/opt/$pkgname/installed/x64-linux-rel" \
        --root="$pkgdir" -O1 --skip-build
}

# vim: set sw=4 ts=4 et:
