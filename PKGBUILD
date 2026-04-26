# Maintainer: plasmaDestroyer <https://github.com/plasmaDestroyer>
pkgname=tack-cli
pkgver=0.8.0
pkgrel=1
pkgdesc="Install any website as a desktop app on Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/plasmaDestroyer/tack"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'cmake')
provides=('tack')
conflicts=('tack')
source=("$pkgname-$pkgver.tar.gz::https://github.com/plasmaDestroyer/tack/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad1ad8ebb64c02f3a8007bfb61140ba4017bdba80b07064a3b3b08191f34c7f4')

prepare() {
    cd "tack-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "tack-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

    # Generate shell completions
    ./target/release/tack completions bash > tack.bash
    ./target/release/tack completions zsh  > _tack
    ./target/release/tack completions fish > tack.fish

    # Generate man page
    ./target/release/tack manpage > tack.1
}

package() {
    cd "tack-$pkgver"

    install -Dm755 target/release/tack "$pkgdir/usr/bin/tack"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Shell completions
    install -Dm644 tack.bash "$pkgdir/usr/share/bash-completion/completions/tack"
    install -Dm644 _tack     "$pkgdir/usr/share/zsh/site-functions/_tack"
    install -Dm644 tack.fish "$pkgdir/usr/share/fish/vendor_completions.d/tack.fish"

    # Man page
    install -Dm644 tack.1 "$pkgdir/usr/share/man/man1/tack.1"
}
