# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Maintainer: Marek Grzelak <marek.grzelak@seqre.dev>

pkgname=cot
pkgver=0.8.0
pkgrel=1
pkgdesc="The Rust web framework for lazy developers - CLI tool"
arch=('x86_64')
url="https://cot.rs"
license=('MIT OR Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("cot-cli-$pkgver.tar.gz::https://github.com/cot-rs/cot/archive/cot-cli-v$pkgver.tar.gz")
md5sums=('2d1f00524be5da8fdf6c60be6deb4393')
sha256sums=('afc7975273801a7587747d6ec37ec1cd8dd328f2438dded92612555197640f71')
b2sums=('6572deb19ce19a95d12ae4981540ba000e32f17eebef2d42c5f90f7a7c372bd6e5fab113d6b55a8fea64b48b284f22a0e043edb03cba79bf91ceec2f1f19ce57')

export RUSTUP_TOOLCHAIN=${RUSTUP_TOOLCHAIN:-stable}
export RUSTFLAGS="${RUSTFLAGS} --remap-path-prefix $srcdir=src -C link-arg=-Wl,--as-needed"

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
    cargo check --frozen
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
