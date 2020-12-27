# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.1.1
pkgrel=7
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/trailofbits/cxx-common"
license=('Apache')
depends=()
makedepends=('clang' 'cmake' 'ninja' 'git' 'python2') # python2 is needed for vcpkg's Z3
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/trailofbits/cxx-common/archive/v${pkgver}.tar.gz"
        '00-cxx-common-0.1.1.patch')
sha256sums=('97a0a35f9dcf65b2f1406aa77fb27594212ed4271a6e21dc26b430adfbf4e92d'
            'a8823b585aec0eb58f9eca35d72074ba5832d2edf1fa6766cc09a27b9b0a4606')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -Np1 -i "$srcdir/00-cxx-common-0.1.1.patch"
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

    ## fix prefix paths
    find $pkgdir/opt/$pkgname/installed/x64-linux-rel/lib/pkgconfig/ -type f \
        -exec sed -i -e "s,$srcdir/$pkgname-$pkgver/vcpkg/packages/[^ ]*_x64-linux-rel,/opt/$pkgname/installed/x64-linux-rel,g" {} +

    ## install lit
    pushd "$srcdir/$pkgname-$pkgver"/vcpkg/buildtrees/llvm-10/src/org-*/llvm/utils/lit
    python3 setup.py install --root="$pkgdir" -O1
    popd
}

# vim: set sw=4 ts=4 et:
