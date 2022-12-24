# Maintainer: zer0-x

pkgname="foxmarks"
pkgver="1.0.1"
pkgrel=1
pkgdesc="A CLI read-only interface for firefox's bookmarks and history"
arch=("x86_64")
url="https://github.com/zer0-x/foxmarks"
license=("GPL3")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zer0-x/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("fe8413faa992f4b0580c02925dce32df88a5ad6bd2066657ca5ef377e121fd0a4a84c5aeb650fde66cfad95d38376556632eb01c57af801c3f50aed088033962")

prepare() {
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

# check() {
#     cd "${pkgname}-${pkgver}"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    cd "${pkgname}-${pkgver}"
    local OUT_DIR=$(find 'target/' -name foxmarks-stamp -print0 | xargs -0 ls -t | head -n1 | xargs dirname)

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install shell completions.
    install -Dm644 "${OUT_DIR}/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "${OUT_DIR}/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${OUT_DIR}/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    # NOTE: https://wiki.archlinux.org/title/Shell_package_guidelines#Shell_completions
    install -Dm644 "${OUT_DIR}/${pkgname}.elv" "${pkgdir}/usr/share/elvish/completions/${pkgname}.elv"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
