# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >

pkgname="eza-git"
_pkgname=${pkgname%-git}
pkgver=0.10.5
pkgrel=1
pkgdesc="A modern replacement for ls"
arch=("x86_64")
url="https://github.com/eza-community/eza"
license=("MIT")
makedepends=("cargo")
checkdepends=("cargo")
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

prepare() {
    cd "${pkgname}"

    git reset --hard "$(git describe --tags --abbrev=0 --match 'v*')"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${pkgname}"

    git describe --tags --abbrev=0 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
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

    # TODO: Install man pages
    # install -Dm644 man/* -t "${pkgdir}/usr/share/man/man1/"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
