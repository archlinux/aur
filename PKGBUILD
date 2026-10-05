# Maintainer: fuero <fuerob@gmail.com>
pkgname=sofka
# renovate: datasource=github-releases depName=nklmilojevic/sofka
pkgver=0.29.9
pkgrel=1
pkgdesc='Kubernetes TUI, reimagined in Rust'
url='https://github.com/nklmilojevic/sofka'
license=('Apache-2.0' 'MIT')
makedepends=('cargo' 'clang')
depends=('glibc' 'libgcc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${pkgname}/${pkgname}-${pkgver}.crate"
)
sha256sums=('cc2683750eac7ad7a0734ae5040f16c6865a7763a216c76afadb2379c82d6a47')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${pkgname}-${pkgver}"
    export CC=clang
    cargo build --frozen --release
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${pkgname}-${pkgver}"
    export CC=clang
    # completion_scripts_work_without_local_configuration fails for now
    RUST_BACKTRACE=1 LANG=C LC_ALL=C cargo test --frozen
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}" *.md docs/*.md
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
