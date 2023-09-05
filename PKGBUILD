# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=eza
pkgver=0.11.0
pkgrel=1
pkgdesc="A modern replacement for ls"
arch=("x86_64")
url="https://github.com/eza-community/eza"
license=("MIT")
conflicts=('eza-git')
depends=("gcc-libs" "zlib" "glibc")
makedepends=("cargo" "pandoc")
checkdepends=("cargo")
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('fdaaf450cfaaa41d6ea8ae12fbb8e41e955e255b1169022a7675ca29d7d621c0')

prepare() {
    cd "${pkgname}-${pkgver}"

    cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features

    # Build man pages
    mkdir -p target/man1 target/man5
    pandoc --standalone -f markdown -t man "man/eza.1.md" > target/man1/eza.1
    pandoc --standalone -f markdown -t man "man/eza_colors.5.md" > target/man5/eza_colors.5
    pandoc --standalone -f markdown -t man "man/eza_colors-explanation.5.md" > target/man5/eza_colors-explanation.5
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable

    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"

    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install shell completions.
    install -Dm644 "completions/zsh/_${pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
    install -Dm644 "completions/bash/${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 "completions/fish/${pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"

    # Install man pages
    install -Dm644 target/man1/* -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 target/man5/* -t "${pkgdir}/usr/share/man/man5/"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
