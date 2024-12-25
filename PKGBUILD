# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=lean
_pkgname=${pkgname#python-}
pkgver=4.14.0
pkgrel=1
pkgdesc='Lean 4 programming language and theorem prover'
arch=('x86_64')
url='https://github.com/leanprover/lean4'
license=('Apache')
groups=()
depends=('gmp' 'libuv' 'llvm-libs')
makedepends=('ccache' 'cmake')
optdepends=()
options=('ccache')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c472518de47d10005784716ad83ffc6f02c99e8e639b04980db35b7f8e02682b')

build() {
    cd "$srcdir/lean4-$pkgver"
    cmake -S . -B build -G 'Unix Makefiles' \
        -D CMAKE_INSTALL_PREFIX="$pkgdir/usr"
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
