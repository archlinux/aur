# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=lstr
pkgver=0.2.1
pkgrel=1
pkgdesc="A fast, minimalist directory tree viewer, written in Rust."
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/bgreenwell/lstr"
makedepends=('rust' 'cargo' 'git')
depends=('glibc' 'gcc-libs' 'libgit2')
options=('strip' 'lto') 
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9a59c59e3b4a0a1537f165a4818daa7cf1ee3feb689eaf8c495f70f280c3e547')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
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
    install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
