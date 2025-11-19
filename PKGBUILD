# Maintainer: Mateusz Maćkowski <mateusz@mackowski.org>
# Contributor: George Tsiamasiotis <gtsiam@windowslive.com>

pkgname=topiary
pkgver=0.7.1
pkgrel=1
pkgdesc='The universal code formatter'
arch=('x86_64')
url='https://topiary.tweag.io/'
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(cargo)
options=(!debug !lto)

source=("$pkgname-$pkgver.tar.gz::https://github.com/tweag/topiary/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d7495caf3c0ae234bd6def6f33193e026564f7818d5909641be119de811f18e')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
export CARGO_BUILD_TARGET="$CARCH-unknown-linux-gnu"

prepare() {
    cd "$pkgname-$pkgver"

    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"

    cargo build --frozen --release --bin topiary

    local topiary="cargo run --frozen --release --bin topiary --"
    mkdir -p completions
    $topiary completion bash > "completions/${pkgname}"
    $topiary completion elvish > "completions/${pkgname}.elv"
    $topiary completion fish > "completions/${pkgname}.fish"
    $topiary completion zsh > "completions/_${pkgname}"

}

check() {
    cd "$pkgname-$pkgver"

    cargo test --frozen -- --skip "coverage_input_ocaml"
}

package() {
    cd "$pkgname-$pkgver"
    
    install -Dm0755 -t "${pkgdir}/usr/bin/" "target/${CARGO_BUILD_TARGET}/release/${pkgname}"
    install -Dm0755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE

    install -Dm 644 -t "${pkgdir}/usr/share/bash-completion/completions/" "completions/${pkgname}"
    install -Dm 644 -t "${pkgdir}/usr/share/elvish/lib/" "completions/${pkgname}.elv"
    install -Dm 644 -t "${pkgdir}/usr/share/fish/vendor_completions.d/" "completions/${pkgname}.fish"
    install -Dm 644 -t "${pkgdir}/usr/share/zsh/site-functions/" "completions/_${pkgname}"
}

