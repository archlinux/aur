# Maintainer: Kurobac <rkurobac at gmail dot com>

pkgname=edgemap
pkgver=1.0.1
pkgrel=1
pkgdesc="DualSense UHID proxy — remap, combo, macro, profile auto-switching"
arch=('x86_64')
url="https://github.com/Kurobac/edgemap"
license=('GPL-3.0-or-later')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('libnotify: desktop notifications on profile switch'
    'python-pyqt6: GUI config editor (edgemap-gui)'
    'hicolor-icon-theme: desktop icon theme support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Kurobac/edgemap/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("e2a686026cfc552e439ab44e5f1b3712363880e6512d96fe032a848e14cd69a7")
install=edgemap.install

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 target/release/dseuhid "$pkgdir/usr/bin/dseuhid"
    install -Dm755 target/release/edgemap "$pkgdir/usr/bin/edgemap"
    install -Dm644 edgemap.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/edgemap.svg"
    install -Dm755 edgemap-gui-v6.py "$pkgdir/usr/bin/edgemap-gui"
    install -Dm644 edgemap.desktop "$pkgdir/usr/share/applications/edgemap.desktop"
    install -Dm644 dseuhid.service "$pkgdir/usr/lib/systemd/system/dseuhid.service"
    install -Dm644 edgemap.service "$pkgdir/usr/lib/systemd/user/edgemap.service"
    install -Dm644 completions/_dseuhid "$pkgdir/usr/share/zsh/site-functions/_dseuhid"
    install -Dm644 completions/_edgemap "$pkgdir/usr/share/zsh/site-functions/_edgemap"
}
