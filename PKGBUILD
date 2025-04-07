# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-thanku
pkgver=0.4.3
pkgrel=1
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
sha256sums=('4d8556a1544c6f74547c60a86af198541b177ddebc06ab24e9d28f238797a951')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

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
