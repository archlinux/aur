# Maintainer: Collide <three-dim-sky@foxmail.com>
# https://github.com/TD-Sky/PKGBUILDs

pkgname=conceal
pkgver=0.6.2
pkgrel=1
pkgdesc="Command line recycle bin"
arch=('x86_64')
url="https://github.com/TD-Sky/conceal"
license=('MIT')
provides=("$pkgname")
conflicts=("$pkgname-bin")
depends=('fzf')
optdepends=('skim: supports skim as finder')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9e56af951fdca9468cdf7b87eafd9cfac29314150d0bccd264f6b6d4428e21d5')
options=(!strip !lto !debug)

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export CONCEAL_GEN_COMPLETIONS='true'
    cd "$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm 755 "target/release/conceal" -t "$pkgdir/usr/bin"
    install -Dm 644 "completions/conceal/_conceal" -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm 644 "completions/conceal/conceal.bash" "$pkgdir/usr/share/bash-completion/completions/conceal"
    install -Dm 644 "completions/conceal/conceal.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm 644 "completions/conceal/conceal.nu" -t "$pkgdir/usr/share/nushell/completions"

    install -Dm 755 "target/release/cnc" -t "$pkgdir/usr/bin"
    install -Dm 644 "completions/cnc/_cnc" -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm 644 "completions/cnc/cnc.bash" "$pkgdir/usr/share/bash-completion/completions/cnc"
    install -Dm 644 "completions/cnc/cnc.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d"
    install -Dm 644 "completions/cnc/cnc.nu" -t "$pkgdir/usr/share/nushell/completions"

    install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
