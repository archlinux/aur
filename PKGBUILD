# Maintainer: Marcel Leismann <info@marcelleismann.de>
pkgname=sshmgr
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple, friendly SSH connection manager for the terminal"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/lecram345/sshmgr"
license=('GPL-3.0-or-later')
depends=('openssh')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2abb31edfe09ac89db89edc3b8ba43ef3f957fa09aec60395392c77d801df96e')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release

    # Generate manpage + completions using the freshly built binary
    mkdir -p dist/completions
    ./target/release/sshmgr gen man > dist/sshmgr.1
    ./target/release/sshmgr gen completions bash > dist/completions/sshmgr.bash
    ./target/release/sshmgr gen completions zsh  > dist/completions/_sshmgr
    ./target/release/sshmgr gen completions fish > dist/completions/sshmgr.fish
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/sshmgr"          "$pkgdir/usr/bin/sshmgr"
    install -Dm644 "dist/sshmgr.1"                   "$pkgdir/usr/share/man/man1/sshmgr.1"
    install -Dm644 "dist/completions/sshmgr.bash"    "$pkgdir/usr/share/bash-completion/completions/sshmgr"
    install -Dm644 "dist/completions/_sshmgr"        "$pkgdir/usr/share/zsh/site-functions/_sshmgr"
    install -Dm644 "dist/completions/sshmgr.fish"    "$pkgdir/usr/share/fish/vendor_completions.d/sshmgr.fish"
    install -Dm644 "README.md"                       "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE"                         "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
