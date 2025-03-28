# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=shiroa
pkgver=0.3.0
pkgrel=1
pkgdesc="shiroa is a simple tool for creating modern online books in pure typst"
arch=('x86_64')
url="https://github.com/Myriad-Dreamin/shiroa"
license=('Apache-2.0')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'yarn')
backup=()
options=(!lto)
source=("$pkgname::git+https://github.com/Myriad-Dreamin/shiroa#tag=v$pkgver"
        "myriad-dreamin-typst::git+https://github.com/Myriad-Dreamin/typst"
        "fix-wasm-module.patch")
b2sums=('cdbc9b96e189d9685439de87c8ff89bf9f7577c1bd55bf898ecb764580b3d8346890a7ad51965deb27f5d05f1ab1949f7bc2d3b25d12aedc81486f62df574466'
        'SKIP'
        '4cb2c73b87c161f49a355014192986c1b327cf295ccbd24176f1b210adef20a19bbc121d9f0d7ac0617d38b15999e300f8ec69718aad75824137d1b45d4bd1b0')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.assets/artifacts.url "$srcdir/myriad-dreamin-typst"
    git -c protocol.file.allow=always submodule update
    patch -Np1 -i ../fix-wasm-module.patch
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo run --frozen --bin shiroa-build
    cargo build --frozen --release --bin shiroa
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s /usr/share/licenses/spdx/Apache-2.0.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
