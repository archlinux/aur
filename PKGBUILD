# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=rust-llm
_pkgname=llm
pkgver=0.1.1
pkgrel=1
pkgdesc='Terminal-first AI hub in Rust for prompting, chat, templates, embeddings and dev workflows'
arch=('x86_64' 'aarch64')
url='https://github.com/imjiaoyuan/llm'
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'gcc')
provides=("${_pkgname}=${pkgver}")
conflicts=('llm' 'llm-bin' 'llm-git' 'rust-llm-bin')
source=(
    "llm-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('b08093c66674b1c339118d2b35099276464879aa6c73fc028a284030085e2f5f')

# Release profile already sets lto=thin and strip=true. crates.io is reached
# during build() (small four-crate dependency set), matching the common
# approach for Rust source packages in this repo.

build() {
    cd "llm-${pkgver}"
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
    install -Dm755 "llm-${pkgver}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "llm-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
