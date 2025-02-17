# Maintainer: Firstname Lastname <email@example.org>

pkgname=falsec
pkgver=0.1.2
pkgrel=1
pkgdesc='Interpreter and compiler for the FALSE language'
url='https://github.com/MixusMinimax/falsec'
license=(MIT)
makedepends=('cargo')
depends=('gcc-libs' 'glibc' 'nasm' 'binutils')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MixusMinimax/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ee7bb268195adf6b81041ea4303ab3a99b5d83b4ac3e0a2b5028b48e4cacc9d7bf627f6156f48890bd1d3b39bd726d80cff99ccfd2ea468b6dcbf403246fb5ed')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 completion/falsec.bash "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -Dm644 completion/falsec.elv "${pkgdir}/usr/share/elvish/lib/${pkgname}.elv"
    install -Dm644 completion/falsec.fish "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    install -Dm644 completion/falsec.zsh "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}
