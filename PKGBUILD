# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=lean
_pkgname=${pkgname#python-}
pkgver=4.21.0
pkgrel=1
pkgdesc='Lean 4 programming language and theorem prover'
arch=('x86_64')
url='https://github.com/leanprover/lean4'
license=('Apache')
groups=()
depends=('gmp' 'libuv' 'llvm19')
makedepends=('ccache' 'clang19' 'cmake' 'git')
optdepends=()
options=('ccache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fb4a1b696fad43336267e9b2f70f3cfb97e4c7f9985af0eee655732312ed7d48')

build() {
    cd "$srcdir/lean4-$pkgver"
    cmake -S . -B build -G 'Unix Makefiles' \
        -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" \
        -D CMAKE_CXX_COMPILER=/usr/lib/llvm19/bin/clang++ \
        -D CMAKE_C_COMPILER=/usr/lib/llvm19/bin/clang \
        -D LLVM=OFF \
        -D LLVM_CONFIG=/usr/sbin/llvm-config-19
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
