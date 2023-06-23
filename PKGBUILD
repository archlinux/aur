# Maintainer: qubidt <qubidt at gmail dot com>
# Contributor: Walter C <bitlord@disroot.org>

pkgname="sd-git"
_pkgname="${pkgname%-git}"
pkgver=0.7.6.r48.g43568a8
pkgrel=1
pkgdesc="Intuitive find & replace CLI"
arch=("i686" "x86_64")
url="https://github.com/chmln/sd"
license=("MIT")
depends=('glibc' 'gcc-libs')
makedepends=("rust" "cargo" "git")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/chmln/sd.git?signed")
validpgpkeys=("5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    # TODO: --locked omitted because Cargo.lock in repo is outdated
    cargo fetch --target "${CARCH}-unknown-linux-gnu"
    rm -r gen/
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
    cargo xtask gen
}

check() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    # test potentially (though not currently) overwrites binary from `build`
    # see: https://gitlab.com/sequoia-pgp/sequoia-sq/-/issues/96
    export CARGO_TARGET_DIR=target-test
    cargo test --release --frozen
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 gen/sd.1 "${pkgdir}/usr/share/man/man1/sd.1"
    install -Dm644 gen/completions/sd.bash "${pkgdir}/usr/share/bash-completion/completions/sd"
    install -Dm644 gen/completions/_sd "${pkgdir}/usr/share/zsh/site-functions/_sd"
    install -Dm644 gen/completions/sd.fish "${pkgdir}/usr/share/fish/vendor_completions.d/sd.fish"
}
