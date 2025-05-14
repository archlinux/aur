# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Maintainer: Marek Grzelak <marek.grzelak@seqre.dev>

pkgname=cot
pkgver=0.3.0
pkgrel=1
pkgdesc="The Rust web framework for lazy developers - CLI tool"
arch=('x86_64')
url="https://cot.rs"
license=('MIT OR Apache-2.0')
makedepends=('cargo')
checkdepends=('cargo')
source=("cot-cli-$pkgver.tar.gz::https://github.com/cot-rs/cot/archive/cot-cli-v$pkgver.tar.gz")
md5sums=('79406ce4f8f836130b8105e36ca787f5')
sha256sums=('c781cb70dc22e89750e901b03e06b5384f4cb084b74d99359bded85bf60b2487')
b2sums=('908b3f6bddde099d8e0574dd110df2ce1ebba023d66c8c918d1ddf57e8f7723aa10ef3c6889c4f17188f76a2135bebcdd7be375f8ab9eed159e06532b3051697')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src"

prepare() {
    cd "$pkgname-cot-cli-v$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-cot-cli-v$pkgver"

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
    cd "$pkgname-cot-cli-v$pkgver"
    cargo check --frozen --release
}

package() {
    cd "$pkgname-cot-cli-v$pkgver"

    install -Dm 755 -t "${pkgdir}/usr/bin" target/release/cot
    install -Dm 644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    find man -maxdepth 1 -type f -exec install -Dm 644 -t "${pkgdir}/usr/share/man/man1/" {} +

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/" "completions/${pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/elvish/lib/" "completions/${pkgname}.elv"
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" "completions/${pkgname}.fish"
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/" "completions/_${pkgname}"
}
