# Maintainer:  kxxt <rsworktech at outlook dot com>
pkgname=shiroa
pkgver=0.2.0
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
        "myriad-dreamin-typst::git+https://github.com/Myriad-Dreamin/typst")
b2sums=('ac0262159cc29dcbae0d76d0d59267c7567f1cc434a81b41fee3ab89e8c9e6b44294cf82df26fed4c6f416ecda301d997f14e77081bb6161a3994a4eb55ff44f'
        'SKIP')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.assets/artifacts.url "$srcdir/myriad-dreamin-typst"
    git -c protocol.file.allow=always submodule update
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
