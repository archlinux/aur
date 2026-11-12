# Maintainer: bsd-source <git@null.net>

pkgname=iwdtray
pkgver=0.1.0
pkgrel=3
pkgdesc='Tray icon and GUI front-end for iwd'
url='https://github.com/bsd-source/iwdtray'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('iwd' 'gtk4>=4.12' 'glib2' 'libgcc' 'glibc')
makedepends=('cargo' 'git')
checkdepends=('dbus')
conflicts=('iwgtk')
backup=('etc/iwdtray/iwdtray.conf')
options=('!lto' '!debug')
source=("$pkgname::git+$url.git#tag=v$pkgver")
# Checksum of the tagged tree: run 'makepkg -g' after tagging each release.
sha256sums=('74f22bf43040d0cdcb70839120357f01f1681e590a348db8660f2d33ea6850b9')

prepare() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "$pkgname"
    export RUSTUP_TOOLCHAIN=stable CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" target/release/iwdtray target/release/iwdtray-gui
    install -Dm644 data/iwdtray.conf "$pkgdir/etc/iwdtray/iwdtray.conf"
    install -Dm644 data/iwdtray.desktop "$pkgdir/etc/xdg/autostart/iwdtray.desktop"
    install -Dm644 -t "$pkgdir/usr/share/applications" data/io.github.bsd_source.iwdtray.desktop
}
