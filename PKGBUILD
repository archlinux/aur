# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=chezmoi_modify_manager
_pkgver=2.1.5
pkgver=${_pkgver/-/.}
pkgrel=2
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
sha256sums=('015bc53fc2de235a1868658993c96c04d708ef52dabf40be3e1b3da3b8868854')
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
    local _cmd_name="target/release/${pkgname}"
    cd "$pkgname-$_pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_cmd_name"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    "$_cmd_name" --bpaf-complete-style-zsh > "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    "$_cmd_name" --bpaf-complete-style-bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    "$_cmd_name" --bpaf-complete-style-fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname}.fish"
    # TODO: Where do completions for elvish go?
    #"$_cmd_name" --bpaf-complete-style-elvish
}
