# Maintainer: Xavier B
pkgbase=reef
pkgname=('reef' 'reef-tools')
pkgver=0.2.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/ZStud/reef"
license=('MIT')
makedepends=('cargo')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/ZStud/reef/archive/v$pkgver.tar.gz")
sha256sums=('d358b383d1a113c3eb69517e29b3da8b0f8c463a11f84969bd6f2bc97f3ff7d9')

prepare() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgbase-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package_reef() {
    pkgdesc="Bash compatibility layer for fish shell — paste bash, it just works"
    depends=('fish' 'bash')

    cd "$pkgbase-$pkgver"

    # Binary
    install -Dm755 target/release/reef "$pkgdir/usr/bin/reef"

    # Core fish functions → vendor_functions.d (auto-loaded by fish)
    install -Dm644 fish/functions/export.fish "$pkgdir/usr/share/fish/vendor_functions.d/export.fish"
    install -Dm644 fish/functions/unset.fish "$pkgdir/usr/share/fish/vendor_functions.d/unset.fish"
    install -Dm644 fish/functions/declare.fish "$pkgdir/usr/share/fish/vendor_functions.d/declare.fish"
    install -Dm644 fish/functions/local.fish "$pkgdir/usr/share/fish/vendor_functions.d/local.fish"
    install -Dm644 fish/functions/readonly.fish "$pkgdir/usr/share/fish/vendor_functions.d/readonly.fish"
    install -Dm644 fish/functions/shopt.fish "$pkgdir/usr/share/fish/vendor_functions.d/shopt.fish"
    install -Dm644 fish/functions/source.fish "$pkgdir/usr/share/fish/vendor_functions.d/source.fish"
    install -Dm644 fish/functions/fish_command_not_found.fish "$pkgdir/usr/share/fish/vendor_functions.d/fish_command_not_found.fish"

    # conf.d (auto-loaded on fish startup)
    install -Dm644 fish/conf.d/reef.fish "$pkgdir/usr/share/fish/vendor_conf.d/reef.fish"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/reef/LICENSE"
}

package_reef-tools() {
    pkgdesc="Modern CLI tool wrappers for fish — grep→rg, find→fd, sed→sd, du→dust, ps→procs, ls→eza, cat→bat, cd→zoxide"
    depends=('fish')
    optdepends=(
        'ripgrep: grep → rg wrapper'
        'fd: find → fd wrapper'
        'sd: sed → sd wrapper'
        'dust: du → dust wrapper'
        'procs: ps → procs wrapper'
        'eza: ls → eza wrapper'
        'bat: cat → bat wrapper'
        'zoxide: cd → zoxide smart directory jumping'
    )

    cd "$pkgbase-$pkgver"

    # Tool wrappers → vendor_functions.d (auto-loaded by fish)
    install -Dm644 fish/functions/tools/grep.fish "$pkgdir/usr/share/fish/vendor_functions.d/grep.fish"
    install -Dm644 fish/functions/tools/find.fish "$pkgdir/usr/share/fish/vendor_functions.d/find.fish"
    install -Dm644 fish/functions/tools/sed.fish "$pkgdir/usr/share/fish/vendor_functions.d/sed.fish"
    install -Dm644 fish/functions/tools/du.fish "$pkgdir/usr/share/fish/vendor_functions.d/du.fish"
    install -Dm644 fish/functions/tools/ps.fish "$pkgdir/usr/share/fish/vendor_functions.d/ps.fish"
    install -Dm644 fish/functions/tools/ls.fish "$pkgdir/usr/share/fish/vendor_functions.d/ls.fish"
    install -Dm644 fish/functions/tools/cat.fish "$pkgdir/usr/share/fish/vendor_functions.d/cat.fish"

    # conf.d (sources wrappers at startup to override fish builtins like grep.fish)
    install -Dm644 fish/conf.d/reef-tools.fish "$pkgdir/usr/share/fish/vendor_conf.d/reef-tools.fish"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/reef-tools/LICENSE"
}
