# Maintainer: fredrir <fhansteen@gmail.com>
# Source AUR package: builds from the tagged GitHub source tarball (so it does
# not depend on crates.io publish timing). The CI release workflow injects
# `pkgver` and recomputes `sha256sums` (via updpkgsums) before pushing.
pkgname=nsql
pkgver=0.1.3
pkgrel=1
pkgdesc="Run SQL from your terminal, composed in your real Neovim — without taking over the screen"
arch=('x86_64')
url="https://github.com/fredrir/nsql"
license=('0BSD')
depends=('dbus' 'gcc-libs')
makedepends=('cargo')
optdepends=('neovim: inline/embedded SQL editor (falls back to vim/vi/$EDITOR otherwise)')
source=("nsql-${pkgver}.tar.gz::https://github.com/fredrir/nsql/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fdb890b3a37e02658ce4d193137e49806e97394421af20a9a27a76fddbcd5d23')

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
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
