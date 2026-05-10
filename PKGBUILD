# Maintainer: HaroldLoui <riven970309@gmail.com>
# Contributor: Hmbown <hmbown@github>

pkgname=deepseek-tui-git
_pkgname=deepseek-tui
pkgver=0.8.26.r1.gc2893b96
pkgrel=1
pkgdesc="Terminal coding agent for DeepSeek models - git version"
arch=('x86_64' 'aarch64')
url="https://github.com/Hmbown/DeepSeek-TUI"
license=('MIT')
options=('!debug')
depends=('dbus')
optdepends=('bash-completion: bash completions'
            'zsh: zsh completions'
            'fish: fish completions')
makedepends=('cargo' 'pkgconf')
provides=('deepseek-tui' 'deepseek')
conflicts=('deepseek-tui' 'deepseek-tui-bin')

source=("$_pkgname::git+https://github.com/Hmbown/DeepSeek-TUI.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --always 2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"

    # Rust 1.88+ required for edition 2024
    : "Building DeepSeek-TUI from source"

    # rust-lld cannot handle GCC LTO objects produced when makepkg's CFLAGS
    # includes -flto=auto. Strip it so sqlite3's C code compiles as native code.
    CFLAGS="${CFLAGS//-flto=auto/}"
    export CFLAGS

    cargo build --release --locked
}

package() {
    cd "$srcdir/$_pkgname"

    # Install binaries
    install -Dm755 target/release/deepseek "$pkgdir/usr/bin/deepseek"
    install -Dm755 target/release/deepseek-tui "$pkgdir/usr/bin/deepseek-tui"

    # Generate shell completions
    ./target/release/deepseek completion bash > deepseek.bash
    install -Dm644 deepseek.bash "$pkgdir/usr/share/bash-completion/completions/deepseek"

    # Install zsh and fish completions (optdepends tells users about them)
    ./target/release/deepseek completion zsh > _deepseek
    install -Dm644 _deepseek "$pkgdir/usr/share/zsh/site-functions/_deepseek"

    ./target/release/deepseek completion fish > deepseek.fish
    install -Dm644 deepseek.fish "$pkgdir/usr/share/fish/vendor_completions.d/deepseek.fish"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
