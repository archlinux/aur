# Maintainer: peippo <christoph.fink@gmail.com>

_pkgbase=martin
pkgname="mbtiles"
pkgdesc="Examine, copy, validate vector tile sets"
url="https://maplibre.org/martin/mbtiles.html"
_git_organisation=maplibre

_martin_pkgver=0.20.0
pkgver=0.14.0
pkgrel=1
_tag="martin-v${_martin_pkgver}"

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
    "${_pkgbase}-${_martin_pkgver}.tar.gz::https://github.com/${_git_organisation}/${_pkgbase}/archive/refs/tags/${_tag}.tar.gz"
    "${_pkgbase}-${_martin_pkgver}-LICENSE-APACHE::https://github.com/${_git_organisation}/${_pkgbase}/raw/refs/tags/${_tag}/LICENSE-APACHE"
    "${_pkgbase}-${_martin_pkgver}-LICENSE-MIT::https://github.com/${_git_organisation}/${_pkgbase}/raw/refs/tags/${_tag}/LICENSE-MIT"
)
b2sums=(
    "a7a295123a9430ce1c07e2182c2ac282d506bb32471e5d901eb443da71d9853379a97963aa2e79eb5fdbfb688904a2238733ca07db26ceca5d1e3cb90ba9ed5a"
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

package() {
    cd "${srcdir}"/${_pkgbase}-${_tag}
    install -Dm 0755 \
        "target/release/mbtiles" \
        "${pkgdir}/usr/bin/mbtiles"

    cd "${srcdir}"
    install -Dm 0644 \
        "${_pkgbase}-${_martin_pkgver}-LICENSE-APACHE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
    install -Dm 0644 \
        "${_pkgbase}-${_martin_pkgver}-LICENSE-MIT" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
