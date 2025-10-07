# Maintainer: Christian Burkard <phantinuss at gmx dot com>
pkgname=yara-x
pkgver=1.8.1
pkgrel=1
pkgdesc="A pure Rust implementation of YARA"
arch=('x86_64')
url="https://github.com/VirusTotal/yara-x"
license=('BSD-3-Clause')
makedepends=('rust')
provides=(yara-x)
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/VirusTotal/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f6230d61ae85356e3c9e9f0fa7c7c94c01d783ec8c43537158e89ffa28e21107')

prepare() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --bin yr --profile release-lto --features=rules-profiling --target "$(rustc -vV | sed -n 's/host: //p')"
}

check() {
    cd "${pkgname}-${pkgver}"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --bin yr --profile release-lto --features=rules-profiling --target "$(rustc -vV | sed -n 's/host: //p')"
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/"$(rustc -vV | sed -n 's/host: //p')"/release-lto/yr"

    mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
    target/"$(rustc -vV | sed -n 's/host: //p')"/release-lto/yr completion zsh > "${pkgdir}/usr/share/zsh/site-functions/_yr"

    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
    target/"$(rustc -vV | sed -n 's/host: //p')"/release-lto/yr completion bash > "${pkgdir}/usr/share/bash-completion/completions/yr"

    mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
    target/"$(rustc -vV | sed -n 's/host: //p')"/release-lto/yr completion fish > "${pkgdir}/usr/share/fish/vendor_completions.d/yr.fish"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
