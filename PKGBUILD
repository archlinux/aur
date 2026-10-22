# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=edamame
pkgver=0.1.6
pkgrel=1
pkgdesc="A Terminal Markdown editor that stays rendered while you edit"
arch=("i686" "x86_64" "aarch64")
license=("Apache-2.0")
url="https://github.com/mijowi/edamame"
makedepends=('rust' 'cargo' 'git')
depends=('glibc' 'libgcc')
options=('!lto' '!debug')
source=("${pkgname}-${pkgver}::git+${url}.git#branch=main")
sha256sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS="${CFLAGS/-flto=auto/}"
    export CARGO_PROFILE_RELEASE_LTO=fat
    export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
    cd "${pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check(){
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
