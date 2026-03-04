# Maintainer: Roman <romankubiv101@gmail.com>
pkgname=music-file-playlist-online-sync
giturl="https://github.com/Balibaloo/music-playlist-online-sync.git"
pkgver=0.2.0
pkgrel=1
pkgdesc="Music folder to local playlists to remote playlist sync tool (Spotify/Tidal)"
arch=('x86_64')
url="https://github.com/Balibaloo/music-playlist-online-sync"
license=('MIT')
depends=('systemd' 'sqlite')
makedepends=('rust' 'cargo' 'pkg-config')
source=("music-playlist-online-sync::git+$giturl")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/music-playlist-online-sync"
  sed -i 's/rusqlite = { version = "0.29", features = \["bundled"\] }/rusqlite = "0.29"/' Cargo.toml
  sed -i 's/reqwest = { version = "0.11", features = \["json", "rustls-tls"\] }/reqwest = { version = "0.11", default-features = true, features = ["json"] }/' Cargo.toml
}

build() {
  cd "$srcdir/music-playlist-online-sync"
  cargo clean
  cargo build --release
}

package() {
  cd "$srcdir/music-playlist-online-sync"
  install -Dm755 target/release/cli "$pkgdir/usr/bin/music-file-playlist-online-sync"
  install -Dm644 config/example-config.toml "$pkgdir/etc/music-sync/example-config.toml"
  install -Dm644 db/schema.sql "$pkgdir/usr/share/$pkgname/schema.sql"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 systemd/music-file-playlist-online-sync-worker.service "$pkgdir/usr/lib/systemd/system/music-file-playlist-online-sync-worker.service"
  install -Dm644 systemd/music-file-playlist-online-sync-worker.timer "$pkgdir/usr/lib/systemd/system/music-file-playlist-online-sync-worker.timer"
  install -Dm644 systemd/music-file-playlist-online-sync-watcher.service "$pkgdir/usr/lib/systemd/system/music-file-playlist-online-sync-watcher.service"
  install -Dm644 systemd/music-file-playlist-online-sync-reconcile.service "$pkgdir/usr/lib/systemd/system/music-file-playlist-online-sync-reconcile.service"
  install -Dm644 systemd/music-file-playlist-online-sync-reconcile.timer "$pkgdir/usr/lib/systemd/system/music-file-playlist-online-sync-reconcile.timer"
}

install=music-file-playlist-online-sync.install
