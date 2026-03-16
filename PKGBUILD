# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=scriptor-git
_pkgname=scriptor
pkgver=r189.b77f9f7
pkgrel=1
pkgdesc='Local speech-to-text CLI & TUI.'
arch=('x86_64' 'aarch64')
url='https://github.com/giacomopiccinini/scriptor'
license=('MIT')
makedepends=('cargo')
options=(!lto)
provides=('scriptor')
conflicts=('scriptor')
source=("$_pkgname::git+$url.git#branch=main")
sha256sums=(SKIP)


pkgver() {
    cd "$_pkgname"
    # git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
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
    install -Dm0755 'target/release/scriptor' "${pkgdir}"/usr/bin/scriptor
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
