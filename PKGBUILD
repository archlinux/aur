# Maintainer: Simon Sawicki <contact@grub4k.dev>
# Contributor: Curtis Jones <accounts@curtis-jones.de>

pkgname="bm.rs"
pkgver="0.1.2"
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
source=("${_srcname}::git+https://github.com/Grub4K/bm.rs#commit=710bf0de91d410812684cc0e73b645e4ed8301c1")
sha256sums=('9087ffa08f6bf6b5bb152eb9f31226ce1e8b2a48b6deb8d9d5add9207833e1c8')
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

