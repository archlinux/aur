# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >

pkgname="eza-git"
_pkgname=${pkgname%-git}
pkgver=v0.11.0.r16.gf5b4f75
pkgrel=1
pkgdesc="A modern replacement for ls"
arch=("x86_64")
url="https://github.com/eza-community/eza"
license=("MIT")
makedepends=("cargo" "pandoc")
checkdepends=("cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

prepare() {
    cd "${pkgname}"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
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
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install shell completions.
    install -Dm644 "completions/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "completions/bash/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "completions/fish/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

    # Install man pages
    install -Dm644 target/man1/* -t "${pkgdir}/usr/share/man/man1/"
    install -Dm644 target/man5/* -t "${pkgdir}/usr/share/man/man5/"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
