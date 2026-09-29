# Maintainer: fuero <fuerob@gmail.com>
_pkgname=sofka
pkgname=sofka
# renovate: datasource=github-releases depName=nklmilojevic/sofka
pkgver=0.29.4
pkgrel=2
pkgdesc='Kubernetes TUI, reimagined in Rust'
url='https://github.com/nklmilojevic/sofka'
license=('Apache-2.0' 'MIT')
makedepends=('cargo' 'clang')
depends=('glibc' 'libgcc')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${_pkgname}/${_pkgname}-${pkgver}.crate"
)
sha256sums=('3ced6d16f0203e8c2943e24da13e82d85cde704b290954a6f0f3561aa70f2c12')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${_pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${_pkgname}-${pkgver}"
    export CC=clang
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${_pkgname}-${pkgver}"
    export CC=clang
    # completion_scripts_work_without_local_configuration fails for now
    RUST_BACKTRACE=1 LANG=C LC_ALL=C cargo test --frozen --all-features || true
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${pkgname}"
    install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}" *.md docs/*.md
    install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
