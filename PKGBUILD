# Maintainer: Absobel <imkonnu@gmail.com>

pkgname=cargo-bootimage-git
_pkgname=cargo-bootimage
pkgver=v0.10.3.18.gd3428c3
pkgrel=1
pkgdesc='Tool to create bootable disk images from a Rust OS kernel.'
arch=('x86_64')
url="https://github.com/rust-osdev/bootimage"
_git="https://github.com/rust-osdev/bootimage.git"
license=('MIT' 'Apache-2.0')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cargo')
source=("${_pkgname}::git+${_git}")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --tags | sed 's/-/./g'
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "${_pkgname}"
    cargo test --frozen --all-features
}

package() {
    cd "${_pkgname}"
    install -Dm755 -t "${pkgdir}/usr/bin" \
        target/release/cargo-bootimage \
        target/release/bootimage
    install -Dm644 Readme.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
