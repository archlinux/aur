# Maintainer: calmcrow <calmcrow@outlook.com>

pkgname=lanchat-git
pkgver=0.1.5
pkgrel=1
pkgdesc="A cross-platform LAN chat software that supports file transfer. (git)"
arch=("x86_64")
url="https://github.com/cap153/LANChat"
license=('MIT')
depends=('webkit2gtk-4.1' 'openssl' 'libappindicator' 'libayatana-appindicator')
makedepends=('base-devel' 'rust' 'cargo' 'tauri-cli' 'curl' 'wget' 'file')
optdepends=('lanclaw-bin: A LANChat-compatible intelligent bot powered by Pi coding agent.')
conflicts=('lanchat-bin')
source=("LANChat::git+https://github.com/cap153/LANChat.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "$srcdir/LANChat"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/LANChat"
    # Clear makepkg CFLAGS that trigger rustc dropping -l (undefined sqlite3): https://github.com/rust-lang/rust/issues/119858
    unset CFLAGS
    cargo tauri build --bundles deb
}

package() {
    cd "$srcdir/LANChat/src-tauri/target/release/bundle/deb" || exit 1
    bsdtar -xf LANChat_*_amd64.deb
    bsdtar -xf data.tar.gz -C "$pkgdir/"
}
