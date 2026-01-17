# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=park
pkgver=1.1.2
pkgrel=1
pkgdesc='Configuration-based dotfiles manager'
arch=('x86_64' 'i686')
url='https://git.sr.ht/~gbrlsnchs/park'
license=('MIT')
makedepends=('cargo' 'scdoc')
optdepends=('gettext: environment variable support in configs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('40cfc189d52b5ef9ed6343b968cd594133b01740c6a13db14ee6812aac292fd3')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-v$pkgver"
    cargo update
    cargo fetch --locked --target host-tuple
}

build () {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-v$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-v$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "target/completions/${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}.bash"
    install -Dm644 "target/completions/${pkgname}.fish" "${pkgdir}/usr/share/fish/completions/${pkgname}.fish"
    install -Dm644 "target/completions/_${pkgname}" "${pkgdir}/usr/share/zsh/functions/Completion/Linux/_${pkgname}"
    install -Dm644 "target/doc/$pkgname.1" -t "$pkgdir/usr/share/man/$pkgname/"
    install -Dm644 "target/doc/$pkgname.5" -t "$pkgdir/usr/share/man/$pkgname/"
}
