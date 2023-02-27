# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="foxmarks"
pkgver="1.0.2"
pkgrel=1
pkgdesc="A CLI read-only interface for firefox's bookmarks and history"
arch=("x86_64")
url="https://github.com/zer0-x/foxmarks"
license=("GPL3")
makedepends=("cargo")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=("7350c04c750e5c3871223a30d78a91edf208aa08bdc5e028da8ebbef099f7c7303857e99e575de63a1152ca39355b8eebe4171fcb783561fb9bf062d6aeee3ad")

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
    install -Dm644 "${OUT_DIR}/shell_completions/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "${OUT_DIR}/shell_completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "${OUT_DIR}/shell_completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    # NOTE: https://wiki.archlinux.org/title/Shell_package_guidelines#Shell_completions
    install -Dm644 "${OUT_DIR}/shell_completions/${pkgname}.elv" "${pkgdir}/usr/share/elvish/completions/${pkgname}.elv"

    # Install man pages
    install -Dm644 "${OUT_DIR}"/man_pages/* -t "${pkgdir}/usr/share/man/man1/"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
