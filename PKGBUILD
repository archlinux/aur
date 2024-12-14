# Maintainer: Adam Perkowski <adas1per@protonmail.com>
# https://github.com/adamperkowski/PKGBUILDs
_pkgname=arrive
pkgname=arv
pkgver=0.3.2
pkgrel=1
pkgdesc="arrive - A simple CLI tool for interacting with Advent of Code"
arch=('x86_64')
url="https://github.com/tranzystorekk/$_pkgname"
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2ce8b04d48a620c6bfa3e8cf12774a17d4d88eacb25be3121378e028dedd6daa')
makedepends=('cargo')
depends=('gcc-libs' 'openssl')
options=('!lto')

prepare() {
    cd "$_pkgname-$pkgver"
    cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname-$pkgver"
    export CARGO_TARGET_DIR=target
    export ARRIVE_ASSETS_GEN_DIR=completions
    cargo build --frozen --release --all-features
}

package() {
    cd "$_pkgname-$pkgver"
    install -Dm0755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

    install -Dm644 "$ARRIVE_ASSETS_GEN_DIR/assets/completions/$pkgname.bash" -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 "$ARRIVE_ASSETS_GEN_DIR/assets/completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions"
    install -Dm644 "$ARRIVE_ASSETS_GEN_DIR/assets/completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/completions"
    install -Dm644 "$ARRIVE_ASSETS_GEN_DIR/assets/completions/$pkgname.elv" -t "$pkgdir/usr/share/elvish/completions"
    install -Dm644 "$ARRIVE_ASSETS_GEN_DIR/assets/completions/_$pkgname.ps1" -t "$pkgdir/usr/share/powershell/Modules/$pkgname/completions"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
