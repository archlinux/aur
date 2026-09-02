# Maintainer: fuero <fuerob@gmail.com>
_pkgname=drift
pkgname=drift-diff
# renovate: datasource=github-releases depName=aymanbagabas/drift
pkgver=0.0.8
pkgrel=1
pkgdesc='A git diff pager that actually wants to be looked at'
url='https://github.com/aymanbagabas/drift'
license=('MIT')
makedepends=('cargo')
depends=()
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
source=(
  #"${pkgname}-${pkgver}.tar.gz::https://static.crates.io/crates/${_pkgname}/${_pkgname}-${pkgver}.crate"
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('d17924f24b5df5fd692ed511cea72d91af7bd23e9e44cbe14e53bfa4b4385fa6')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${_pkgname}-${pkgver}"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "${_pkgname}-${pkgver}"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "${_pkgname}-${pkgver}"
    cargo test --frozen --all-features
}

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
    install -Dm644  -t "${pkgdir}/usr/share/doc/${pkgname}" *.md
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
