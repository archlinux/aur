# Maintainer: Mario Oenning <mo-son[at]mailbox[dot]org>
# Author: codic12 <https://github.com/codic12>

_pkgbase='worm'
pkgname='worm-git'
pkgdesc="A floating, tag-based window manager written in Rust"
pkgver=0.1.0.43.gacbb619
pkgrel=1
arch=('x86_64')
url="https://github.com/codic12/worm"
license=('MIT')
makedepends=('cargo' 'git')
depends=('xorg-server')
install=$_pkgbase.install

source=("$_pkgbase::git+$url.git"
        "worm.desktop")
sha256sums=('SKIP'
            '1e0247e50f06a575c927348f888d5a0ba77874526917cb864f7f4502280a133f')

pkgver() {
    cd "$_pkgbase"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgbase"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgbase"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    # X session file
    install -Dm544 "worm.desktop" "$pkgdir/usr/share/xsessions/worm.desktop"

    cd "$_pkgbase"

    # bin
    install -D -m755 "target/release/worm" "$pkgdir/usr/bin/worm"
    install -D -m755 "target/release/wormc" "$pkgdir/usr/bin/wormc"

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
