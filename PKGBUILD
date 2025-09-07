# Maintainer: ElmForestW <elmforestw@proton.me>

pkgname=centerpiece
pkgver=1.1.1
pkgrel=1
pkgdesc="Your trusty omnibox search"
arch=("x86_64")
url="https://github.com/friedow/centerpiece"
license=("MIT") # https://github.com/friedow/centerpiece/blob/2a610e8e0a6b65b733ea98f2ca602235f695b4f3/flake.nix#L123
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("SKIP")

prepare() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}"
}
