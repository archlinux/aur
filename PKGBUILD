# Maintainer: Simon Sawicki <contact@grub4k.dev>
# Contributor: Curtis Jones <accounts@curtis-jones.de>

pkgname="bm.rs"
pkgver="0.1.1"
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
source=("${_srcname}::git+https://github.com/Grub4K/bm.rs#commit=06a945d5d23a7252717f2c8609cbfe97e15122e0")
sha256sums=("6a4fcc68f01be5537a4482af4da5ea9351e52a83acb471d268653ffccbcfa412")

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

