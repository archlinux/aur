# Maintainer: Frederik Holm Strøm <aur@frederikstroem.com>

_pkgname="psource"
pkgname="${_pkgname}-git"
pkgver=0.1.7.f02b632 # This will be dynamically replaced by the pkgver() function
pkgrel=1
pkgdesc="CLI tool to pretty print source code to stdout or directly to the clipboard."
arch=('x86_64')
url="https://github.com/frederikstroem/psource"
source=("${pkgname}::git+${url}.git")
license=('MIT')
depends=("libgit2.so")
makedepends=('git' 'cargo')
checkdepends=("cargo")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
    cd "${pkgname}"

    # Get the latest tag without the "v" prefix, then append the short commit hash
    local _tag=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
    local _commit=$(git rev-parse --short HEAD)
    echo "${_tag}.${_commit}"
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
    export CARGO_TARGET_DIR=target

    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}"

    # Install binary
    install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    # Install readme
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

    # Install license
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
