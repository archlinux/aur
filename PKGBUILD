# Maintainer: zer0-x

pkgname="foxmarks"
pkgver="1.0.0"
pkgrel=1
pkgdesc="A CLI read-only interface for firefox's bookmarks and history"
arch=("x86_64")
url="https://github.com/zer0-x/foxmarks"
license=("GPL3")
makedepends=("cargo" "jq")
# changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zer0-x/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("1be84ebb84d863721d007216649cc50cda8bf418e5e6ebc5cdcf32f7922a86b38d165d55e1354555cbd49a899daefaf21ad09bb2ad27802e1b9ea41e2db8a97c")

prepare() {
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features --message-format=json |
    jq -r 'select(.out_dir) | select(.package_id | startswith("foxmarks ")) | .out_dir' > out_dir
}

# check() {
#     cd "${pkgname}-${pkgver}"
#     export RUSTUP_TOOLCHAIN=stable
#     cargo test --frozen --all-features
# }

package() {
    cd "${pkgname}-${pkgver}"
    local OUT_DIR=$(<out_dir)

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install shell completions.
    install -Dm644 "${OUT_DIR}/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "${OUT_DIR}/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${OUT_DIR}/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    # NOTE: https://wiki.archlinux.org/title/Shell_package_guidelines#Shell_completions
    install -Dm644 "${OUT_DIR}/${pkgname}.elv" "${pkgdir}/usr/share/elvish/completions/${pkgname}.elv"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
