# Maintainer: Tim Visee <tim@visee.me>
#
# This PKGBUILD is managed externally, and is automatically updated here:
# - https://gitlab.com/timvisee/ffsend/blob/master/pkg/aur/ffsend/PKGBUILD
# - Mirror: https://github.com/timvisee/ffsend/blob/master/pkg/aur/ffsend/PKGBUILD

pkgname=ffsend
pkgver=0.2.76
pkgrel=1
pkgdesc="Easily and securely share files from the command line. A Send client."
url="https://gitlab.com/timvisee/ffsend"
license=('GPL3')
source=("https://gitlab.com/timvisee/ffsend/-/archive/v0.2.76/ffsend-v0.2.76.tar.gz")
sha256sums=('82a55bbc1afce99093cd84b2c623bfeadd509dfd592fbdd961f1156c8a80b0bd')
arch=('x86_64' 'i686')
depends=('ca-certificates')
makedepends=('cargo' 'cmake' 'openssl>=1.0')
optdepends=('xclip: clipboard support')

prepare() {
    cd "$pkgname-v$pkgver"

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname-v$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$pkgname-v$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"

    # Shell completions and LICENSE file
    install -Dm644 "contrib/completions/ffsend.bash" \
        "$pkgdir/etc/bash_completion.d/ffsend"
	install -Dm644 "contrib/completions/_ffsend" \
        "$pkgdir/usr/share/zsh/site-functions/_ffsend"
	install -Dm644 "contrib/completions/ffsend.fish" \
        "$pkgdir/usr/share/fish/vendor_completions.d/ffsend.fish"
    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/ffsend/LICENSE"
}
