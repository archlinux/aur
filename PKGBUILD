# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Maintainer: Marek Grzelak <marek.grzelak@seqre.dev>

pkgname=cot
pkgver=0.7.0
pkgrel=1
pkgdesc="The Rust web framework for lazy developers - CLI tool"
arch=('x86_64')
url="https://cot.rs"
license=('MIT OR Apache-2.0')
makedepends=('cargo')
checkdepends=('cargo')
source=("cot-cli-$pkgver.tar.gz::https://github.com/cot-rs/cot/archive/cot-cli-v$pkgver.tar.gz")
md5sums=('ca7c4c39d14aada9bd4dca5f46136f60')
sha256sums=('029416cda3b80e1d02f9097e64402e761a40d25e4f89aaf6a47049203b0690b1')
b2sums=('80258510b6065fe9e4b5b815b7a11879c2c7ecd1ced7f97fe57ba21d58c9018c1b998d4d4736f741648f69caf19b35fdd5430d1725a6d73e0a2641cdde92fd08')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "$pkgname-cot-cli-v$pkgver" || exit

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-cot-cli-v$pkgver" || exit

    cargo build --frozen --release --all-features --target-dir target --bin cot

    local cot="cargo run --frozen --release --bin cot --"
    mkdir -p man completions
    $cot cli manpages --output-dir "man"
    $cot cli completions bash > "completions/${pkgname}"
    $cot cli completions elvish > "completions/${pkgname}.elv"
    $cot cli completions fish > "completions/${pkgname}.fish"
    $cot cli completions zsh > "completions/_${pkgname}"
}

check() {
    cd "$pkgname-cot-cli-v$pkgver" || exit
    cargo check --frozen --release
}

package() {
    cd "$pkgname-cot-cli-v$pkgver" || exit

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cot
    install -Dm 644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find man -maxdepth 1 -type f -exec install -Dm 644 -t "${pkgdir}/usr/share/man/man1/" {} +

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/" "completions/${pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/elvish/lib/" "completions/${pkgname}.elv"
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" "completions/${pkgname}.fish"
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/" "completions/_${pkgname}"
}
