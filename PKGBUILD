# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=lean
_pkgname=${pkgname#python-}
pkgver=4.27.0
pkgrel=1
pkgdesc='Lean 4 programming language and theorem prover'
arch=('x86_64')
url='https://github.com/leanprover/lean4'
license=('Apache-2.0')
groups=()
depends=('gmp' 'libuv' 'llvm')
makedepends=('ccache' 'clang' 'cmake' 'git')
optdepends=()
options=('ccache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6e81a8b5ffdd73bb0911ad7bdb0b14616137c4b54610036b8c1b50856fe0b550')

build() {
    cd "$srcdir/lean4-$pkgver"
    export CC=/usr/bin/clang
    export CXX=/usr/bin/clang++
    cmake -S . -B build -G 'Unix Makefiles' \
        -D CMAKE_C_COMPILER=/usr/bin/clang \
        -D CMAKE_C_COMPILER_LAUNCHER=/usr/bin/ccache \
        -D CMAKE_CXX_COMPILER=/usr/bin/clang++ \
        -D CMAKE_CXX_COMPILER_LAUNCHER=/usr/bin/ccache \
        -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -D LLVM=OFF \
        -D LLVM_CONFIG=/usr/bin/llvm-config
    cmake --build build
}

package() {
    cd "$srcdir/lean4-$pkgver"

    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "build/stage1"

    install -Dm 0755 -t $pkgdir/usr/bin bin/*
    install -Dm 0644 -t $pkgdir/usr/include/lean include/lean/*

    install -d $pkgdir/usr/lib/lean
    (find -L lib/lean -type f -iname '*.so*' -printf '%P\n' |
     xargs -I '{}' -- install -DTm0755 'lib/lean/{}' "$pkgdir/usr/lib/lean/{}")
    (find -L lib/lean -type f ! -iname '*.so' -printf '%P\n' |
     xargs -I '{}' -- install -DTm0644 'lib/lean/{}' "$pkgdir/usr/lib/lean/{}")

    install -d $pkgdir/usr/src/lean
    (find -L src/lean -type f -iname '*.lean' -printf '%P\n' |
     xargs -I '{}' -- install -DTm0644 'src/lean/{}' "$pkgdir/usr/src/lean/{}" )

    install -d $pkgdir/usr/share/lean
    install -Dm 0644 -t $pkgdir/usr/share/lean share/lean/*
}
