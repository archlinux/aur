# Maintainer: ElmForestW <elmforestw@proton.me>

pkgname=centerpiece
pkgver=1.1.1
pkgrel=2
pkgdesc="Your trusty omnibox search"
arch=("x86_64")
url="https://github.com/friedow/centerpiece"
license=("MIT") # https://github.com/friedow/centerpiece/blob/2a610e8e0a6b65b733ea98f2ca602235f695b4f3/flake.nix#L123
depends=("gcc-libs" "glibc")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("6e170390b744182185b61b3986169dae5c57bc3b32a8adddfa385311bb521f04")
b2sums=("9c339f28c7b492f74c0e5697cc37c25ba4f6121603c528d08e772405bf37a4cf4e427467171b4332c2e5d4267374147ea8d9ca94aacecae0e6175fee3cae9a33")

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
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
