# Maintainer: TwoWells <mwellsa@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=themis
pkgver=0.1.0
pkgrel=1
pkgdesc="A theme orchestrator CLI for Linux"
arch=('x86_64')
url="https://github.com/TwoWells/Themis"
license=('AGPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
provides=('themis')
conflicts=('themis-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TwoWells/Themis/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('482e4a26e3fd162f0bb6c6eb755aeae4e02218172e111c7eb5b8f0dd5229a5ad')

# The GitHub archive extracts to Themis-$pkgver/ (the repo name is capitalized).
_srcdir="Themis-$pkgver"

prepare() {
    cd "$_srcdir"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_srcdir"
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_srcdir"
    install -Dm755 "target/release/themis" "$pkgdir/usr/bin/themis"
    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    install -dm755 "$pkgdir/usr/share/fish/vendor_completions.d"
    "target/release/themis" completions bash > "$pkgdir/usr/share/bash-completion/completions/themis"
    "target/release/themis" completions zsh > "$pkgdir/usr/share/zsh/site-functions/_themis"
    "target/release/themis" completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/themis.fish"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
