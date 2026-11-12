# Maintainer: bsd-source <git@null.net>

pkgname=iwdtray
pkgver=0.1.0
pkgrel=1
pkgdesc='Tray icon and GUI front-end for iwd'
url='https://github.com/bsd-source/iwdtray'
arch=('x86_64')
license=('GPL-3.0-or-later')
depends=('iwd' 'gtk4>=4.12' 'glib2' 'libgcc' 'glibc')
makedepends=('cargo' 'git')
conflicts=('iwgtk')
backup=('etc/iwdtray.conf')
options=('!lto' '!debug')
source=("$pkgname::git+$url.git#tag=v$pkgver")
# Checksum of the tagged tree: run 'makepkg -g' after tagging each release.
sha256sums=('c14de5e41994ba80a21707bc022404222cc7a8a62bc8f034038b438b4f668870')

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
    install -Dm644 data/iwdtray.conf "$pkgdir/etc/iwdtray.conf"
    install -Dm644 data/iwdtray.desktop "$pkgdir/etc/xdg/autostart/iwdtray.desktop"
    install -Dm644 -t "$pkgdir/usr/share/applications" data/io.github.bsd_source.iwdtray.desktop
}
