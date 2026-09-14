# Maintainer: taotieren <admin@taotieren.com>

pkgname=cargo-thanku
pkgver=0.5.1
pkgrel=2
pkgdesc="A command-line tool for generating acknowledgments for your Rust project dependencies."
arch=($CARCH)
url="https://github.com/YuniqueUnic/cargo-thanku"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=()
makedepends=(
    git
    cargo
)
backup=()
options=('!lto' '!debug')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('2a33b2c4725c58172eb522ff658b9928fa58f43d12a23eaf5f3560e4784e9c6a')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
    cd "${srcdir}/${pkgname}/"
    cargo fetch --locked --target host-tuple
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

check() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --all-features
}

package() {
    cd "${srcdir}/${pkgname}/"

    export RUSTUP_TOOLCHAIN=stable
    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
    install -Dm0644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    cd target/release/

    local _sh _compdest
    for _sh in bash zsh fish elvish; do
        ./cargo-thanku completions "$_sh" > "cargo-thanku.$_sh"
        case "$_sh" in
            bash) _compdest="$pkgdir/usr/share/bash-completion/completions/cargo-thanku" ;;
            zsh)  _compdest="$pkgdir/usr/share/zsh/site-functions/_cargo-thanku" ;;
            fish) _compdest="$pkgdir/usr/share/fish/vendor_completions.d/cargo-thanku.fish" ;;
            fish) _compdest="$pkgdir/usr/share/elvish/lib/cargo-thanku.elv" ;;
        esac
        install -Dm0644 "cargo-thanku.$_sh" "$_compdest"
    done
}
