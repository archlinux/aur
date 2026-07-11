# Maintainer: fredrir <fhansteen@gmail.com>
# Source AUR package: builds from the tagged GitHub source tarball (so it does
# not depend on crates.io publish timing). The CI release workflow injects
# `pkgver` and recomputes `sha256sums` (via updpkgsums) before pushing.
pkgname=nsql
pkgver=0.1.8
pkgrel=1
pkgdesc="Run SQL from your terminal, composed in your real Neovim — without taking over the screen"
arch=('x86_64' 'aarch64')
url="https://github.com/fredrir/nsql"
license=('0BSD')
# makepkg's -flto=auto compiles the bundled sqlite3.c to GCC-LTO bitcode,
# which rust-lld cannot read (undefined sqlite3_* at link time).
options=('!lto')
depends=('dbus' 'gcc-libs')
makedepends=('cargo')
optdepends=('neovim: inline/embedded SQL editor (falls back to vim/vi/$EDITOR otherwise)')
source=("nsql-${pkgver}.tar.gz::https://github.com/fredrir/nsql/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a0fe22f20b4c8c891ed889107267eee92d1f796bf6e78146d1d4259b62a7033b')

prepare() {
    cd "nsql-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "nsql-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

# No check(): the test suite includes smoke tests that spawn editors and probe
# local databases, which are not reliable inside a clean build chroot.

package() {
    cd "nsql-${pkgver}"
    install -Dm755 "target/release/nsql" "${pkgdir}/usr/bin/nsql"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "THIRD-PARTY-LICENSES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-LICENSES.md"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
