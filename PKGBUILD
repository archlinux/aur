# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Sashanoraa <sasha@noraa.gay>

pkgname=license
pkgver=3.1.0
pkgrel=2
pkgdesc='A tool to easily add a license to your project'
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/$pkgname"
license=('MPL-2.0')
source=("$pkgname-$pkgver::https://git.sr.ht/~zethra/$pkgname/archive/$pkgver.tar.gz")
depends=('gcc-libs' 'glibc' 'sh')
makedepends=('cargo' 'scdoc')
optdepends=(
    'fzf: required for interactive scripts: set-license, copy-header'
    'xclip: required for interactive scripts: set-license, copy-header'
    'wl-clipboard: required for interactive scripts: set-license, copy-header'
)
sha256sums=('67e16dc8f048ea5e92e1f91c4739b9611cec23a80533e9305f1dfcd448c9ed55')

prepare() {
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
    scdoc < doc/license.scd > license.1
}

check() {
    cd $pkgname-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 target/release/$pkgname "$pkgdir/usr/bin/$pkgname"
    install -Dm755 scripts/set-license "$pkgdir/usr/bin/set-license"
    install -Dm755 scripts/copy-header "$pkgdir/usr/bin/copy-header"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 license.1 "$pkgdir/usr/share/man/man1/license.1"

    install -Dm644 completions/$pkgname.bash \
        "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -Dm644 completions/_$pkgname \
        "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -Dm644 completions/$pkgname.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
