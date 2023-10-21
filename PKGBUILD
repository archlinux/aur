# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: zefr0x < Matrix: "@zer0-x:kde.org" >

pkgname="eza-git"
_pkgname=${pkgname%-git}
pkgver=0.15.0.r3.g32567d0
pkgrel=1
pkgdesc="A modern replacement for ls"
arch=("x86_64")
url="https://github.com/eza-community/eza"
license=("MIT")
depends=("libgit2.so")
makedepends=("git" "cargo" "pandoc")
checkdepends=("cargo")
provides=("${_pkgname}" "exa")
replaces=("exa")
conflicts=("${_pkgname}" "exa")
source=("${pkgname}::git+${url}#branch=main")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"

    cargo fetch --frozen --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
    cd "${pkgname}"

    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release

    # Build man pages
    mkdir -p target/man target/man
    for manpage in eza.1 eza_colors.5 eza_colors-explanation.5; do
        pandoc --standalone -f markdown -t man "man/${manpage}.md" > "target/man/${manpage}"
    done
}

check() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo test --frozen --release
}

package() {
    cd "${pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s eza "${pkgdir}/usr/bin/exa"

    # Install shell completions.
    install -Dm644 "completions/zsh/_${_pkgname}" "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
    install -Dm644 "completions/bash/${_pkgname}" "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
    install -Dm644 "completions/fish/${_pkgname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"

    # Install man pages
    install -Dm644 target/man/*.1 -t "${pkgdir}/usr/share/man/man1"
    install -Dm644 target/man/*.5 -t "${pkgdir}/usr/share/man/man5"

    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    install -Dm644 "LICENCE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
}
