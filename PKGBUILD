# Maintainer: Sergey A. <murlakatamenka@disroot.org>
#
# Ex-maintainers:
#   - Daniel Menelkir <dmenelkir@gmail.com>
#   - Donovan Glover <https://donovan.is>

pkgname=hyprdim
pkgver=2.2.4
pkgrel=1
pkgdesc="Automatically dim windows in Hyprland when switching between them"
arch=('x86_64')
url="https://github.com/donovanglover/hyprdim"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/donovanglover/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('549257dbcb1b64c2090b3ea171b6a2aef4591f322d26c55be87d1d6456fbd913')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 'target/release/hyprdim' -t "$pkgdir/usr/bin"

    # shell completions
    install -Dm 644 'target/completions/_hyprdim' -t "$pkgdir/usr/share/zsh/site-functions/_hyprdim"
    install -Dm 644 'target/completions/hyprdim.bash' -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm 644 'target/completions/hyprdim.fish' -t "$pkgdir/usr/share/fish/vendor_completions.d"

    # docs
    install -Dm 644 'target/man/hyprdim.1' -t "$pkgdir/usr/share/man/man1"
    install -Dm 644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname"

    install -Dm 644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}
