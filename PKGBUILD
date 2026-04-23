# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=matchmaker-git
_pkgname=matchmaker
pkgver=0.0.24.r2.gf059f69
pkgrel=1
pkgdesc='A fast, configurable and intuitive fuzzy searcher.'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/Squirreljetpack/matchmaker'
license=('AGPL-3.0')
makedepends=('cargo' 'git')
options=(!lto)
provides=('mm')
conflicts=('matchmaker' 'matchmaker-bin')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 'target/release/mm' "$pkgdir/usr/bin/mm"
    install -Dm644 -t "$pkgdir/usr/share/bash-completion/completions" matchmaker-cli/assets/completions/mm.bash
    install -Dm644 -t "$pkgdir/usr/share/zsh/site-functions" matchmaker-cli/assets/completions/_mm
    install -Dm644 -t "$pkgdir/usr/share/fish/vendor_completions.d" matchmaker-cli/assets/completions/mm.fish
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" matchmaker-cli/LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" matchmaker-cli/README.md
}

# vim: ts=4 sw=4 et:
