# Maintainer: Tournesol <bonjour@tournesol.me>

pkgname=hx-lsp
pkgver=0.2.11
pkgrel=2
pkgdesc="One LSP server support snippets and actions for helix editor."
url="https://github.com/erasin/hx-lsp"
license=("MIT")
arch=("x86_64" "aarch64")
provides=("$pkgname")
conflicts=("$pkgname")
# depends=("gcc-libs","glibc")
depends=()
makedepends=("cargo")
source=(${pkgname}-${pkgver}::"${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('65a6a1ad81c46a21e319ab2f3695269a7c046962d4d942cd6f5edacf71d17e82')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}

