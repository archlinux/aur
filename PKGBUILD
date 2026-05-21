# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=swpui-git
_pkgname=swpui
pkgver=0.7.2.r5.gdfa0a03
pkgrel=1
pkgdesc='Search and replace, TUI style.'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/beeb/swpui'
license=(
     'Apache-2.0'
     'MIT'
)
makedepends=(
    'cargo'
    'git'
)
provides=('swp')
conflicts=('swpui' 'swpui-bin')
source=("$_pkgname-main::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}-main"
    git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}-main"
    cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
    cd "${_pkgname}-main"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${_pkgname}-main"
    install -Dm0755 target/release/swp "$pkgdir/usr/bin/swp"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-APACHE
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE-MIT
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
