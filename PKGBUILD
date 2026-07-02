# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=patent-git
_pkgname=patent
pkgver=0.7.0.r0.ga68becc
pkgrel=1
pkgdesc='A prior-art search for your code ideas. Stop building what already exists.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/r14dd/patent'
license=(
    'Apache-2.0'
    'MIT'
)
optdepends=(
    'ollama: powers the LLM verdict'
)
makedepends=(
    'cargo'
    'openssl'
    'gcc'
    'git'
)
options=(
    !lto
    !debug
)
provides=('patent')
conflicts=('patent' 'patent-bin')
source=(
    "${_pkgname}-main::git+$url.git#branch=main"
    'patent.install'
)
install=patent.install
sha256sums=(
    'SKIP'
    '24dff75c38b578cb7e8057366a764cb4313078f16bada568baf79ecde5cb49af'
)

pkgver() {
    cd "${_pkgname}-main"
    git describe --tags --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/patent "$pkgdir/usr/bin/patent"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
