# Maintainer: bipin kumar <kbipinkumar@pm.me>
pkgname=cramino
pkgver=1.4.0
pkgrel=1
pkgdesc='A fast tool for BAM/CRAM quality evaluation of long reads. https://doi.org/10.1093/bioinformatics/btad311'
arch=(x86_64)
depends=('gcc-libs' 'glibc' 'bzip2')
makedepends=('git' 'rust' 'cmake' 'clang')
url='https://github.com/wdecoster/cramino'
license=('MIT')
options=(!lto)
_tag=${pkgver}
source=(${pkgname}-${pkgver}::git+https://github.com/wdecoster/cramino.git#tag=${_tag})
sha256sums=('8ddec90b0810eef704bd7c0f170727e74e3088b19dce8c6c508242c099a348f6')

prepare() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch  --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd ${pkgname}-${pkgver}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd ${pkgname}-${pkgver}
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

