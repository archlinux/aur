# Maintainer: Simon Sawicki <contact@grub4k.dev>
# Contributor: Curtis Jones <accounts@curtis-jones.de>

pkgname="bm.rs"
pkgver="0.1.3"
pkgrel="1"
pkgdesc="Bookmark paths and quickly change into bookmarked directories"
url="https://github.com/Grub4K/bm.rs"
arch=("x86_64")
license=("MIT")
makedepends=(
    "cargo"
    "git"
)
options=(
    "!debug"
)

_binname="bm"
_srcname="${pkgname}-${pkgver}"
source=("${_srcname}::git+https://github.com/Grub4K/bm.rs#commit=5ad19b8c1e8370db63d020c955860f8a5759125f")
sha256sums=('81d9fd21f9c3ed87af42ecc5c5ac346ba7dd55f3844e57c5281e8b3562bf09f6')
prepare() {
    cd "${_srcname}"
    export RUSTUP_TOOLCHAIN="stable"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_srcname}"
    export RUSTUP_TOOLCHAIN="stable"
    export CARGO_TARGET_DIR="target"
    cargo build --release --frozen
}

package() {
    install -Dm0755 -t "${pkgdir}/usr/bin/" "${_srcname}/target/release/${_binname}"
    install -Dm0644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${_srcname}/LICENSE"
}
