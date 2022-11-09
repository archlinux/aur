# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=qvm
pkgver=1.17.2
pkgrel=1
pkgdesc="The high-performance and featureful Quil simulator."
arch=('x86_64')
url="https://github.com/quil-lang/qvm"
license=('Apache' 'AGPL3')
depends=(quicklisp quilc sbcl)
conflicts=(rigetti-qvm-git)
_static_vectors_patch='e2b0dd016ac7cec4f7dd83838cfac222aded95d7.patch'
_intrinsics_patch='e839fa9568214488a09c51ffeda1137581e77a60.patch'
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "https://github.com/quil-lang/qvm/commit/$_static_vectors_patch" # https://github.com/quil-lang/qvm/pull/276
    "https://github.com/quil-lang/qvm/commit/$_intrinsics_patch" # https://github.com/quil-lang/qvm/pull/289
    "disable_qvm_ng.patch" # https://github.com/quil-lang/qvm/pull/298 https://github.com/quil-lang/qvm/pull/300
)
b2sums=('ff8355327ce3f068fe3c38016b1d0f5e38833239f00b0ffb6bffd938514151c6203856b3964298d3eba19b82d8af80967c54f1fa65af430bd043136a1f8b5612'
        'd79f46c7183e8723a38c5781af4ac2540be46f63edde20e362e4da79cdb354e2e19245c742b2abc6c83894e61bf45fd0a0cef66e2e50df783022f51d3f198202'
        'd189855a0282e07a624772443ddd00136d605764cb7ba815700505adbe0528dd119795898a92df5ff55f3c599040c37657fc8be490b93179829c589b17e4fa77'
        '5c886c011c9cc6f3683539103b7c2487d25d2ce277c4ad65dbc2440fe880861cece3f8c22a545ae506e11133e09cd6fd3b69b3764686674033919a601ab04fe7')

prepare() {
    cd $pkgname-$pkgver
    patch -p1 < "$srcdir/$_static_vectors_patch"
    patch -p1 < "$srcdir/$_intrinsics_patch"
    patch -p1 < "$srcdir/disable_qvm_ng.patch"
    sed -i 's/$(HOME)/./' Makefile # use local directory instead of home
    export QVM_WORKSPACE=4096 # edit this in case you get heap exhaustion
}

build() {
    cd $pkgname-$pkgver
    make QVM_FEATURES='qvm-intrinsics' qvm
}

check() {
    cd $pkgname-$pkgver
    make test
}

package() {
    cd $pkgname-$pkgver
    mkdir -p "$pkgdir/usr/bin"
    make DESTDIR="$pkgdir" PREFIX=/usr install
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

