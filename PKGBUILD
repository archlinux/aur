# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Contributor: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=topiary
pkgver=0.8.0
pkgrel=1
pkgdesc='The universal code formatter'
arch=('x86_64')
url='https://topiary.tweag.io/'
license=(MIT)
depends=(glibc libgcc)
makedepends=('rust')
options=(!debug !lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/topiary/topiary/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('203bdc6007989f51ef728424c7e051da2c131c0415fc76fb359da8fc49b8006e')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$pkgname-$pkgver" || exit

    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver" || exit

    cargo build --frozen --release --bin topiary

    local topiary="cargo run --frozen --release --bin topiary --"
    mkdir -p completions
    $topiary completion bash > "completions/${pkgname}"
    $topiary completion elvish > "completions/${pkgname}.elv"
    $topiary completion fish > "completions/${pkgname}.fish"
    $topiary completion zsh > "completions/_${pkgname}"

}

check() {
    cd "$pkgname-$pkgver" || exit

    # Parallel tests compiling the same grammar into a cold cache race on
    # tree-sitter-loader's lock file, so run them one at a time.
    cargo test --frozen -- --test-threads=1 --skip "coverage_input_ocaml"
}

package() {
    cd "$pkgname-$pkgver" || exit
    
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/${CARGO_BUILD_TARGET}/release/${pkgname}"
    install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/" "completions/${pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/elvish/lib/" "completions/${pkgname}.elv"
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" "completions/${pkgname}.fish"
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/" "completions/_${pkgname}"
}
