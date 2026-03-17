# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>FiTui=fitui
pkgname=deadbranch-git
_pkgname=deadbranch
pkgver=0.1.0.r55.g7749df2
pkgrel=1
pkgdesc='Clean up stale git branches safely.'
arch=('x86_64' 'aarch64')
url='https://github.com/armgabrielyan/deadbranch'
license=('MIT')
makedepends=('cargo' 'patch')
options=(!lto)
provides=('deadbranch')
conflicts=('deadbranch' 'deadbranch-bin')
source=("$_pkgname::git+$url.git#branch=main"
    'read-man-dir-from-env.patch')
sha256sums=('SKIP'
            '4018a4f5366bb8ef156d29ec73948b1b6ed5446da3e6847ade0f612d7744419c')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$_pkgname"
    patch -p1 < ../read-man-dir-from-env.patch
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export MAN_OUT_DIR=${CARGO_TARGET_DIR}/man
    cargo build --frozen --release
}

package() {
    cd "$_pkgname"
    install -Dm0755 'target/release/deadbranch' "${pkgdir}"/usr/bin/deadbranch
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/man/man1/" 'target/man/deadbranch.1'
    command -v gzip >/dev/null 2>&1 && gzip -9 "$pkgdir/usr/share/man/man1/deadbranch.1"
}

# vim: ts=4 sw=4 et:
