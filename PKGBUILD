# Maintainer: Christopher Kodama <ckhordiasma@gmail.com>
pkgname=cccc-git
_pkgname=cccc
pkgver=r1.cac03ce
pkgrel=1
pkgdesc="Estimate Claude Code API spend by scanning local session files (development version)"
arch=('x86_64')
url="https://github.com/ckhordiasma/cccc"
license=('GPL-3.0-or-later')
depends=('gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$_pkgname"
    install -Dm755 target/release/cccc "$pkgdir/usr/bin/cccc"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE   "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
