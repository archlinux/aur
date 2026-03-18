# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Sashanoraa <sasha@noraa.gay>

pkgname=license
pkgver=3.2.1
pkgrel=2
pkgdesc='A tool to easily add a license to your project'
arch=(x86_64 i686 armv7h aarch64)
url="https://sr.ht/~zethra/$pkgname"
license=(MPL-2.0)
depends=(glibc libgcc sh)
makedepends=(cargo scdoc)
optdepends=('fzf: required for interactive scripts: set-license, copy-header'
            'xclip: required for interactive scripts: set-license, copy-header'
            'wl-clipboard: required for interactive scripts: set-license, copy-header')
source=("$pkgname-$pkgver::https://git.sr.ht/~zethra/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('e7eca671edbe67bf983b5a12a86e8dd8a200db3ead61304ab9c4c198d366b84e')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target host-tuple
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    scdoc < doc/license.scd > license.1
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features --workspace
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
    install -Dm755 scripts/set-license -t "$pkgdir/usr/bin"
    install -Dm755 scripts/copy-header -t "$pkgdir/usr/bin"

    install -Dm644 license.1 -t "$pkgdir/usr/share/man/man1"

    install -Dm644 completions/$pkgname.bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 completions/$pkgname.fish -t "$pkgdir/usr/share/fish/vendor_completions.d"
}
