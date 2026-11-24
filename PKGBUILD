# Maintainer: paperbenni <paperbenni@gmail.com>
pkgname=ins
pkgver=0.16.0
pkgrel=1
pkgdesc="A powerful command-line tool for managing dotfiles, system diagnostics, and instantOS configurations"
arch=('x86_64')
url="https://instantos.io"
license=('GPL-2.0-only')
provides=('instantpacman' 'instantsettings' 'instantupdate' 'instantwelcome')
conflicts=('instantpacman' 'instantsettings' 'instantupdate' 'instantwelcome')
replaces=('instantpacman' 'instantsettings' 'instantupdate' 'instantwelcome')
depends=('glibc' 'gcc-libs' 'fzf' 'git' 'sqlite')
makedepends=('rust')
checkdepends=('ntfs-3g' 'ntfsprogs' 'ffmpeg')
optdepends=(
    'instantmenu: for graphical menus and INS Open'
    'restic: for backup functionality'
    'kitty: default terminal for scratchpad'
    'ntfsprogs: for NTFS partition resize detection (dual-boot)'
    'ntfs-3g: for mounting Windows NTFS partitions (dual-boot)'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/instantOS/instantCLI/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c76a620eb2d0e3d09e643cb484be5ae2bc1d6a821ec2ef638849984be4485229')
options=('!lto')  # Disable LTO as recommended for Rust packages

prepare() {
    cd "instantCLI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "instantCLI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "instantCLI-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "instantCLI-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 src/assist/actions/emoji/LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/emoji-catalog-LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    for desktop_file in desktop/*.desktop; do
        install -Dm644 "$desktop_file" "$pkgdir/usr/share/applications/$(basename "$desktop_file")"
    done

    install -Dm644 systemd/ins-notify.service \
        "$pkgdir/usr/lib/systemd/user/ins-notify.service"
}
