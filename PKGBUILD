# Maintainer: zer0-x < Matrix: "@zer0-x:kde.org" >

pkgname="git-cm-git"
_pkgname=${pkgname%-git}
pkgver=0.2.3
pkgrel=1
pkgdesc="Easily create conventional-commits friendly commit messages for git"
arch=("x86_64")
url="https://github.com/mainrs/git-cm"
license=("APACHE" "MIT")
depends=("git")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}#branch=main")
sha512sums=("SKIP")

pkgver() {
    cd "${pkgname}"
    git describe --tags --abbrev=0 --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname}"

    git reset --hard "$(git describe --tags --abbrev=0 --match 'v*')"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release --all-features
}

package() {
    cd "${pkgname}"

    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm755 "license-mit" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-MIT"
    install -Dm755 "license-apache" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
    install -Dm644 "readme.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
