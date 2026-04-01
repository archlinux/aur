# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Maintainer: Marek Grzelak <marek.grzelak@seqre.dev>

pkgname=cot
pkgver=0.6.0
pkgrel=1
pkgdesc="The Rust web framework for lazy developers - CLI tool"
arch=('x86_64')
url="https://cot.rs"
license=('MIT OR Apache-2.0')
makedepends=('cargo')
checkdepends=('cargo')
source=("cot-cli-$pkgver.tar.gz::https://github.com/cot-rs/cot/archive/cot-cli-v$pkgver.tar.gz")
md5sums=('ea90156afd16ad20a47a34a10ce7d15f')
sha256sums=('3a89b7157e35464f32d2b830ad3065653e27f5a1cf3d175c86da8290ebc5d104')
b2sums=('19cbf75db4a329e31b2dbe48d0ca65eafb978125b2ff961509320a36b8e733456cf35ad5996e4f234efa004b5d20490dd6613d7b351e7bb99b90dc55554bf50d')

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
