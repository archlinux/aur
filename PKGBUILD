# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=chezmoi_modify_manager
_pkgver=2.1.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Tools for chezmoi to handle mixed settings and state"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/chezmoi_modify_manager"
license=('GPL3')
depends=('openssl')
makedepends=('cargo')
install=
changelog=
source=("$pkgname-$_pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-${_pkgver}.crate")
noextract=()
sha256sums=('a4e510985634ebd3257a70cec22d37f30a872922e7cc20d351ed0d99b85a76c9')
validpgpkeys=()

prepare() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features
}

check() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --no-default-features
}

package() {
    cd "$pkgname-$_pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    "target/release/$pkgname" --bpaf-complete-style-zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "target/release/$pkgname" --bpaf-complete-style-bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    # TODO: Where do completions for these go?
    #"target/release/$pkgname" --bpaf-complete-style-fish
    #"target/release/$pkgname" --bpaf-complete-style-elvish
}
