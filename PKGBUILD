pkgname=music-tui
pkgver=0.3.1
pkgrel=1
pkgdesc="A keyboard and mouse-driven terminal music player built with ratatui"
arch=('x86_64')
url="https://github.com/adelmonte/music-tui"
license=('MIT')
depends=('alsa-lib')
makedepends=('cargo' 'cmake')
optdepends=('yt-dlp: the Spotify and Explore tabs (finding and downloading songs)'
            'ffmpeg: playing songs as they download, and the Radio and Podcasts tabs')
# rusqlite bundles sqlite3.c; building it under makepkg's -flto=auto yields LTO
# objects that rust-lld can't resolve (undefined sqlite3_* symbols), so disable LTO.
options=('!lto')
install=music-tui.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2801737c53eb65676b41236102e2a23e030fdc7dbbd107ca3955ff58e49b0293')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/music-tui" "$pkgdir/usr/bin/music-tui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 contrib/music-tui-sync.service "$pkgdir/usr/lib/systemd/user/music-tui-sync.service"
}
