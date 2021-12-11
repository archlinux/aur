# Maintainer: Stelios Tsampas <loathingkernel @at gmail .dot com>

pkgname=psxact-git
pkgver=0.r405.e482871
pkgrel=1
pkgdesc="Sony Playstation emulator focused on accuracy"
arch=('x86_64')
url="https://gitlab.com/psxact/psxact"
license=('GPL3')
depends=('sdl2')
makedepends=('git' 'cargo')
provides=("${pkgname/%-git/}")
conflicts=("${pkgname/%-git/}")
source=("${pkgname/%-git/}::git+https://gitlab.com/psxact/psxact.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname/%-git/}"
    printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname/%-git/}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_HOME="$srcdir"/cargo
    cargo update --manifest-path psxact-cli/Cargo.toml
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu" --manifest-path psxact-cli/Cargo.toml
}

build() {
    cd "${pkgname/%-git/}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=build
    export CARGO_HOME="$srcdir"/cargo     
    cargo build --frozen --release --all-features --manifest-path psxact-cli/Cargo.toml
}

package() {
    cd "${pkgname/%-git/}"
    install -dm 755 "$pkgdir"/usr/{bin,share/{doc,licenses}/"$pkgname"}
    install -m 755 build/release/psxact-cli "$pkgdir"/usr/bin/
    install -m 644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/
    install -m 644 README.md "$pkgdir"/usr/share/doc/"$pkgname"/
}
