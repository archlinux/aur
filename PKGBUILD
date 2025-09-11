# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Maintainer: Marek Grzelak <marek.grzelak@seqre.dev>

pkgname=cot
pkgver=0.4.0
pkgrel=1
pkgdesc="The Rust web framework for lazy developers - CLI tool"
arch=('x86_64')
url="https://cot.rs"
license=('MIT OR Apache-2.0')
makedepends=('cargo')
checkdepends=('cargo')
source=("cot-cli-$pkgver.tar.gz::https://github.com/cot-rs/cot/archive/cot-cli-v$pkgver.tar.gz")
md5sums=('8dc51cdbd0bbe2592e7fb4cea5fb20e0')
sha256sums=('bf5bd31cd4b4ac405c994912dad45a51d23c2b6941bee2b05f77da76449392d7')
b2sums=('0fdd6a763d6b5a29241a8d340ef20c9e483069b27e35571931a58eef1fdcf9a920faa04af890a7e7dce722f9e314f1af85e6b654696807fdb3adb7dadb272fde')

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
