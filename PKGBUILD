# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=lstr
pkgver=0.3.0
pkgrel=1
pkgdesc="A fast, minimalist directory tree viewer, written in Rust."
arch=("i686" "x86_64" "aarch64")
license=("MIT")
url="https://github.com/bgreenwell/lstr"
makedepends=('rust' 'cargo' 'git')
depends=('glibc' 'gcc-libs' 'libgit2')
options=('strip' 'lto') 
source=("${url}/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fec5f7444cbf32c826c10a932e30fdc1a1a4673828c11b82929c585e5614fbf8')

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
