# Maintainer: HaroldLoui <riven970309@gmail.com>
# Contributor: Hmbown <hmbown@github>

pkgname=deepseek-tui-git
_pkgname=deepseek-tui
pkgver=0.8.60.r0.gae101a12
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
provides=('codewhale-tui' 'codewhale')
conflicts=('codewhale-tui' 'codewhale-tui-bin')

install="$pkgname.install"
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
    install -Dm755 target/release/codewhale "$pkgdir/usr/bin/codewhale"
    install -Dm755 target/release/codewhale-tui "$pkgdir/usr/bin/codewhale-tui"

    # Generate shell completions
    ./target/release/codewhale completion bash > codewhale.bash
    install -Dm644 codewhale.bash "$pkgdir/usr/share/bash-completion/completions/codewhale"

    # Install zsh and fish completions (optdepends tells users about them)
    ./target/release/codewhale completion zsh > _codewhale
    install -Dm644 _codewhale "$pkgdir/usr/share/zsh/site-functions/_codewhale"

    ./target/release/codewhale completion fish > codewhale.fish
    install -Dm644 codewhale.fish "$pkgdir/usr/share/fish/vendor_completions.d/codewhale.fish"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
