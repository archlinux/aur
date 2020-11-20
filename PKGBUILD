# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cxx-common
pkgver=0.0.14
pkgrel=4
pkgdesc="Common dependency management for various Trail of Bits C++ codebases"
arch=('x86_64')
url="https://github.com/trailofbits/cxx-common"
license=('Apache')
depends=('python' 'openssl' 'ncurses' 'libxml2' 'zlib')
makedepends=('python-setuptools' 'clang' 'cmake' 'ninja' 'git')
checkdepends=()
options=('staticlibs' '!strip')
source=("https://github.com/trailofbits/cxx-common/archive/v${pkgver}.tar.gz")
sha256sums=('1f7c3de3fa491cfba52abd4ae5fe5cc00112309239737b89ecc8c00a9b6cb2c2')

build() {
    export LLVM_VERSION=1000
    export BOOTSTRAP="$srcdir/bootstrap"
    export LIBRARIES="$srcdir/libraries"
    cd "$srcdir/$pkgname-$pkgver"

    ## bootstrap cmake
    ./pkgman.py \
        --verbose \
        --c_compiler=/usr/bin/clang \
        --cxx_compiler=/usr/bin/clang++ \
        --repository_path="${BOOTSTRAP}" \
        --packages=cmake

    ## build z3 and llvm
    ./pkgman.py \
        --verbose \
        --c_compiler=/usr/bin/clang \
        --cxx_compiler=/usr/bin/clang++ \
        --llvm_version=${LLVM_VERSION} \
        --exclude_libcxx \
        --additional_paths="${BOOTSTRAP}/cmake/bin" \
        --repository_path="${LIBRARIES}" \
        --packages=z3,llvm

    rm -rf "$srcdir/$pkgname-$pkgver"/build/cmake*

    ## build the rest of the libraries
    ./pkgman.py \
        --verbose \
        --c_compiler="${LIBRARIES}/llvm/bin/clang" \
        --cxx_compiler="${LIBRARIES}/llvm/bin/clang++" \
        --additional_paths="${BOOTSTRAP}/cmake/bin:${LIBRARIES}/llvm/bin" \
        --repository_path="${LIBRARIES}" \
        --packages=cmake,google,xed
}

package() {
    install -dm 755 "$pkgdir/opt/$pkgname"
    cp -r "$srcdir/libraries" "$pkgdir/opt/$pkgname/"
    find "$pkgdir/opt/$pkgname"/libraries/*/lib/pkgconfig -type f -name '*.pc' \
        -exec sed -i -e "s|$srcdir|/opt/$pkgname|g" {} \;
}

# vim: set sw=4 ts=4 et:
