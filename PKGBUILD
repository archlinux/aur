# Maintainer: peippo <christoph.fink@gmail.com>

pkgname="mbtiles"
pkgdesc="Examine, copy, validate vector tile sets"
url="https://maplibre.org/martin/mbtiles.html"

pkgver=0.14.2
pkgrel=1

_pkgbase=martin
_git_organisation=maplibre
_tag="${pkgname}-v${pkgver}"

arch=("x86_64" "i686")
license=("Apache-2.0 OR MIT")

depends=(
    "gcc-libs"
    "glibc"
)
makedepends=(
    "cargo"
    "npm"
)

options=("!lto")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/${_git_organisation}/${_pkgbase}/archive/refs/tags/${_tag}.tar.gz"
    "${pkgname}-${pkgver}-LICENSE-APACHE::https://github.com/${_git_organisation}/${_pkgbase}/raw/refs/tags/${_tag}/LICENSE-APACHE"
    "${pkgname}-${pkgver}-LICENSE-MIT::https://github.com/${_git_organisation}/${_pkgbase}/raw/refs/tags/${_tag}/LICENSE-MIT"
)
b2sums=(
    "c57d71d40031892a685f4693cffdec12b7a79120d75719cce924c63c927ff9741c450fa3ed96d26f75b2c26e9f538e1682d4d90e135037eedd43525675c1e235"
    "cb5ba44d3653218aa76bc8b1d7c1d26b3a72dd35da7490d430a5dda727e9750015c28206d8d7e7c29701dd0c3d24198ff159f2566aff72f9f6edb1f493c0a968"
    "fc19c34e958648930a8d8cc56542ffd8eabdea36954d61e9e2f8c6b7f48bef66a61233c5097a5b4f40b79321bfb16b8ef445de0460af115413f7fd3dea825bc9"
)

prepare() {
    cd "${srcdir}"/${_pkgbase}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${srcdir}"/${_pkgbase}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CFLAGS=
    cargo build --frozen --release --all-features --package mbtiles
}

check() {
    cd "${srcdir}"/${_pkgbase}-${_tag}
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --package mbtiles
}

package() {
    cd "${srcdir}"/${_pkgbase}-${_tag}
    install -Dm 0755 \
        "target/release/mbtiles" \
        "${pkgdir}/usr/bin/mbtiles"

    cd "${srcdir}"
    install -Dm 0644 \
        "${pkgname}-${pkgver}-LICENSE-APACHE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm 0644 \
        "${pkgname}-${pkgver}-LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
