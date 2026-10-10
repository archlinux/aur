# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream was renamed from llm to yak in v0.3.7 (config migrates
# ~/.llm -> ~/.yak automatically on first run).

pkgname=rust-yak
_pkgname=yak
pkgver=0.4.1
pkgrel=1
pkgdesc='Terminal-first AI coding agent in Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/imjiaoyuan/yak'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'gcc')
provides=("${_pkgname}=${pkgver}")
conflicts=('yak' 'yak-bin' 'yak-git' 'rust-yak-bin' 'rust-llm' 'rust-llm-bin')
source=(
    "${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('6072149747fb6ac1348e9ac1fc99ef1a62412b34b95338fdd64d80dc1246756b')

# Release profile already sets lto=thin and strip=true. crates.io is reached
# during build() (small four-crate dependency set), matching the common
# approach for Rust source packages in this repo.

build() {
    cd "${_pkgname}-${pkgver}"
    # Arch's default CFLAGS include -flto=auto, which makes the bundled C code
    # (ring, libsqlite3-sys) emit GCC LTO objects that rustc's lto=thin + linker
    # cannot resolve, so the link fails with undefined sqlite3_*/ring_* symbols.
    # Build the C halves without it; the Rust profile is unaffected.
    export CFLAGS="${CFLAGS//-flto=auto/}"
    export CXXFLAGS="${CXXFLAGS//-flto=auto/}"
    export LDFLAGS="${LDFLAGS//-flto=auto/}"
    cargo build --release --locked
}

package() {
    install -Dm755 "${_pkgname}-${pkgver}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
