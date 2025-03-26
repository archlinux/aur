# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-thanku
pkgver=0.4.2
pkgrel=0
pkgdesc="A command-line tool for generating acknowledgments for your Rust project dependencies."
arch=($CARCH)
url="https://github.com/YuniqueUnic/cargo-thanku"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    gcc-libs
    glibc
)
makedepends=(cargo)
backup=()
options=('!lto' '!debug')
install=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6be3cc1f6c681c886d138066f1176d7e300069e9c237a7e2d84c9b120f9c025b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -dm0755 ${pkgdir}/usr/share/bash-completion/completions/ \
        ${pkgdir}/usr/share/zsh/site-functions/ \
        ${pkgdir}/usr/share/fish/completions/ \
        ${pkgdir}/usr/share/elvish/lib/

    cd $pkgdir/usr/bin/

    ./cargo-thanku completions bash >${pkgdir}/usr/share/bash-completion/completions/cargo-thanku
    ./cargo-thanku completions zsh >${pkgdir}/usr/share/zsh/site-functions/_cargo-thanku
    ./cargo-thanku completions fish >${pkgdir}/usr/share/fish/completions/cargo-thanku.fish
    ./cargo-thanku completions elvish >${pkgdir}/usr/share/elvish/lib/cargo-thanku.elv
}
