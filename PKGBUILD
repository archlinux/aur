# Maintainer: Arvid Norlander <VorpalBlade@users.noreply.github.com>
pkgname=chezmoi_modify_manager-git
pkgver=3.0.0.r10.b9b08b7
pkgrel=1
pkgdesc="Tools for chezmoi to handle mixed settings and state"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/VorpalBlade/chezmoi_modify_manager"
license=('GPL-3.0-only')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('chezmoi_modify_manager::git+https://github.com/VorpalBlade/chezmoi_modify_manager')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    export CHEZMOI_MODIFY_MANAGER_BUILDER=aur-git
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    export CHEZMOI_MODIFY_MANAGER_BUILDER=aur-git
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --no-default-features --features=keyring
}

check() {
    cd "$srcdir/${pkgname%-git}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --no-default-features --features=keyring
}

package() {
    local _cmd_name="target/release/${pkgname%-git}"
    cd "$srcdir/${pkgname%-git}"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_cmd_name"
    mkdir -p "$pkgdir/usr/share/bash-completion/completions/"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d/"
    "$_cmd_name" --bpaf-complete-style-zsh > "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-git}"
    "$_cmd_name" --bpaf-complete-style-bash > "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
    "$_cmd_name" --bpaf-complete-style-fish > "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
    # TODO: Where do completions for elvish go?
    #"$_cmd_name" --bpaf-complete-style-elvish
}
