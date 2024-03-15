# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=chezmoi_modify_manager
_pkgver=3.2.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Tools for chezmoi to handle mixed settings and state"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/chezmoi_modify_manager"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$_pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-${_pkgver}.crate")
sha256sums=('2d2523191418e1fa443bbd835dd927c75eb1f79882b9be6357856b019c19437c')

prepare() {
    cd "$pkgname-$_pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$_pkgver"
    export CHEZMOI_MODIFY_MANAGER_BUILDER=aur
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=keyring
}

check() {
    cd "$pkgname-$_pkgver"
    export CHEZMOI_MODIFY_MANAGER_BUILDER=aur
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --no-default-features --features=keyring
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
    # No support to install distro completions in elvish.
    # See https://github.com/elves/elvish/issues/1739
    #"$_cmd_name" --bpaf-complete-style-elvish
}
